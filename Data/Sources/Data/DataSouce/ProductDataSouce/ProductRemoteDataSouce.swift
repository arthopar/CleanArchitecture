//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 04.09.23.
//

import Foundation

public final class ProductRemoteDataSouce: ProductDataSouce {
    private let productApiToDataModelMapper: ProductToDataMapper
    private let productDetailsApiToDataModelMapper: ProductDetailsToDataMapper
    private let networkService: NetworkService

    public init(productApiToDataModelMapper: ProductToDataMapper,
                productDetailsApiToDataModelMapper: ProductDetailsToDataMapper,
                networkService: NetworkService)
    {
        self.productApiToDataModelMapper = productApiToDataModelMapper
        self.productDetailsApiToDataModelMapper = productDetailsApiToDataModelMapper
        self.networkService = networkService
    }

    public func getProducts(params: GetProductsDataModel) async throws -> [ProductDataModel] {
        let productRequest = ProductEndpoint(offset: params.offset,
                                             limit: params.count)
        let result: [ProductRemoteModel] = try await networkService.request(productRequest)
        return result.map { productApiToDataModelMapper.map($0) }
    }

    public func getProductDetails(params _: GetProductDetailsDataModel) async throws -> ProductDetailsDataModel {
        preconditionFailure()
    }
}
