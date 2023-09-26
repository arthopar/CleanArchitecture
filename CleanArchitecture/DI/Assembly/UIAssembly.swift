//
//  UIAssembly.swift
//  CleanArchitecture
//
//  Created by Artak Tsatinyan on 12.09.23.
//

import UIKit
import Swinject
import UI
import Presentation

class UIAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ProductScreenFactory.self) { resolver in
      return ProductScreenFactoryImp()
    }

    container.register(ProductViewController.self) { resolver in
      let viewModel = resolver.resolve(ProductViewModeling.self)!
      return ProductViewController(viewModel: viewModel)
    }

    container.register(ProductCoordinator.self) { (resolver, navigationController: UINavigationController) in
      let productScreenFactory = resolver.resolve(ProductScreenFactory.self)!
      return ProductCoordinatorImp(navigationController: navigationController,
                                    productScreenFactory: productScreenFactory)
    }

    container.register(ProductDetailsViewController.self) { (resolver, argument: ProductDetailsViewModeling) in
      let viewModel = resolver.resolve(ProductDetailsViewModeling.self, argument: argument)!
      return ProductDetailsViewController(viewModel: viewModel)
    }
  }
}


