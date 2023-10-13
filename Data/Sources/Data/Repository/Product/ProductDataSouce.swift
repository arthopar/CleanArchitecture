//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 04.09.23.
//

import Foundation

public protocol ProductDataSouce {
    func getProducts(params: GetProductsDataModel) async throws -> [ProductDataModel]
    func getProductDetails(params: GetProductDetailsDataModel) async throws -> ProductDetailsDataModel
}
