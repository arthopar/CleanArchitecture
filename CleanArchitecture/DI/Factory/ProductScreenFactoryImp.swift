//
//  ProductScreenFactoryImp.swift
//  CleanArchitecture
//
//  Created by Artak Tsatinyan on 12.09.23.
//

import Foundation
import UI

class ProductScreenFactoryImp: ProductScreenFactory {
    func createProductScreen() -> ProductViewController {
        container.resolve(ProductViewController.self)!
    }

    func createProductDetails(model: ProductDetailsNavigationModel) -> ProductDetailsViewController {
        container.resolve(ProductDetailsViewController.self, argument: model)!
    }
}
