//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 31.08.23.
//

import Foundation

public protocol ProductCoordinator: Coordinator {
    func showProductDetailScreen(model: ProductDetailsNavigationModel)
}
