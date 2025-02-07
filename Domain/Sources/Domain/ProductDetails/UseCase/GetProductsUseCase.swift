//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

public protocol GetProductsUseCase: Sendable {
    func execute(params: GetProductsDomainModel) async throws -> [ProductDomainModel]
}
