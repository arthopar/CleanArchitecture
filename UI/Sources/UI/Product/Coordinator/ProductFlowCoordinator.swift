//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 31.08.23.
//

import UIKit

public class ProductCoordinatorImp: BaseCoordinator, ProductCoordinator {
    private let productScreenFactory: ProductScreenFactory

    public init(navigationController: UINavigationController,
                productScreenFactory: ProductScreenFactory)
    {
        self.productScreenFactory = productScreenFactory
        super.init(navigationController: navigationController)
    }

    public func start() {
        let screen = productScreenFactory.createProductScreen()
        screen.coordinator = self
        navigationController.pushViewController(screen, animated: true)
    }

    public func showProductDetailScreen(model: ProductDetailsNavigationModel) {
        let screen = productScreenFactory.createProductDetails(model: model)
        screen.coordinator = self
        navigationController.pushViewController(screen, animated: true)
    }
}
