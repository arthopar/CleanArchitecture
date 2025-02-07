//
//  FirstViewController.swift
//  CleanArchitecture
//
//  Created by Artak Tsatinyan on 29.08.23.
//

import Combine
import Presentation
import UIKit

public class ProductViewController: UIViewController {
    weak var coordinator: ProductCoordinator?
    private let viewModel: ProductViewModeling
    private var cancelable: [AnyCancellable] = []
    private lazy var dataSource: UITableViewDiffableDataSource<Int, ProductUiModel> = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = item.title
        return cell
    }

    private lazy var tableView: UITableView = .init(frame: view.bounds, style: .plain)
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let loaderView = UIActivityIndicatorView()
        loaderView.startAnimating()
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        tableView.addSubview(loaderView)
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
        ])
        tableView.delegate = self
        return loaderView
    }()

    private let productUiModelMapper = ProductUiModelMapper()

    public init(viewModel: ProductViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")

        viewModel.productUpdatedPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] models in
                guard let self else { return }
                let uiModels = models.map { self.productUiModelMapper.map($0) }
                applySnapshot(with: uiModels)
            }.store(in: &cancelable)

        viewModel.shouldShowLoaderPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isVisible in
                guard let self else { return }
                self.activityIndicatorView.isHidden = !isVisible
            }.store(in: &cancelable)

        viewModel.openProductPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] productId in
                self?.openProductDetail(productId: productId)
            }.store(in: &cancelable)
        viewModel.viewDidLoad()
    }

    func openProductDetail(productId: Int) {
        coordinator?.showProductDetailScreen(model: .init(productId: productId))
    }

    func applySnapshot(with data: [ProductUiModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, ProductUiModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)

        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ProductViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.productSelectedAction(index: indexPath.row)
    }
}
