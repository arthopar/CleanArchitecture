//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 02.09.23.
//

import Foundation

public class GetProductDetailsUseCaseImp: GetProductDetailsUseCase {
    private let reposytory: ProductRepository

    public init(reposytory: ProductRepository) {
        self.reposytory = reposytory
    }

    public func execute(params: GetProductDetailsDomainModel) async throws -> ProductDetailsDomainModel {
        try await reposytory.getProductDetails(params: params)
    }
}
