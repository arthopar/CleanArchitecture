//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 31.08.23.
//

import Foundation

@MainActor
public protocol ProductCoordinator: Coordinator {
    func showProductDetailScreen(model: ProductDetailsNavigationModel)
}
