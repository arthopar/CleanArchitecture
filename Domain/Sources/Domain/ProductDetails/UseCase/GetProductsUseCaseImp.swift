//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 02.09.23.
//

import Foundation

public class GetProductsUseCaseImp: GetProductsUseCase {
    private let reposytory: ProductRepository

    public init(reposytory: ProductRepository) {
        self.reposytory = reposytory
    }

    public func execute(params: GetProductsDomainModel) async throws -> [ProductDomainModel] {
        try await reposytory.getProducts(params: params)
    }
}
