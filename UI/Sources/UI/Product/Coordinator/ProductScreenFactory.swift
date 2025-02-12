//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 31.08.23.
//

import UIKit

@MainActor
public protocol ProductScreenFactory {
    func createProductScreen() -> ProductViewController
    func createProductDetails(model: ProductDetailsNavigationModel) -> ProductDetailsViewController
}
