//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

public protocol GetProductDetailsUseCase {
  func execute(params: GetProductDetailsDomainModel) async throws -> ProductDetailsDomainModel
}
