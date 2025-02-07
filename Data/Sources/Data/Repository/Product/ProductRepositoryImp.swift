//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 04.09.23.
//

import Domain
import Foundation

public final class ProductRepositoryImp: ProductRepository {
    let remoteDataSouce: ProductDataSouce
    let productsRrequestDomainToDataMapper: GetProductsRrequestDomainToDataMapper
    let productDataToDomainModelMapper: ProductDataToDomainModelMapper

    public init(remoteDataSouce: ProductDataSouce,
                productsRrequestDomainToDataMapper: GetProductsRrequestDomainToDataMapper,
                productDataToDomainModelMapper: ProductDataToDomainModelMapper)
    {
        self.remoteDataSouce = remoteDataSouce
        self.productsRrequestDomainToDataMapper = productsRrequestDomainToDataMapper
        self.productDataToDomainModelMapper = productDataToDomainModelMapper
    }

    public func getProducts(params: GetProductsDomainModel) async throws -> [ProductDomainModel] {
        let model = productsRrequestDomainToDataMapper.map(params)
        let result = try await remoteDataSouce.getProducts(params: model)
        return result.map { productDataToDomainModelMapper.map($0) }
    }

    public func getProductDetails(params _: GetProductDetailsDomainModel) async throws -> ProductDetailsDomainModel {
        preconditionFailure()
    }
}
