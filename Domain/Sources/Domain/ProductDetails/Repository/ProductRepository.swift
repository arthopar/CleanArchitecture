//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 02.09.23.
//

import Foundation

public protocol ProductRepository {
  func getProducts(params: GetProductsDomainModel) async throws -> [ProductDomainModel]
  func getProductDetails(params: GetProductDetailsDomainModel) async throws -> ProductDetailsDomainModel
}
