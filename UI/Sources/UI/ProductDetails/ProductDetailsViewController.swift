//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 29.08.23.
//

import Presentation
import UIKit

public class ProductDetailsViewController: UIViewController {
    weak var coordinator: ProductCoordinator?
    private let viewModel: ProductDetailsViewModeling

    public init(viewModel: ProductDetailsViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
}
