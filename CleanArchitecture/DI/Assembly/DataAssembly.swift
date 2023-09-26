//
//  DataAssembly.swift
//  CleanArchitecture
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation
import Swinject
import Data
import Domain

class DataAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ProductRepository.self) { resolver in
      let remoteDataSouce = resolver.resolve(ProductDataSouce.self)!
      return ProductRepositoryImp(remoteDataSouce: remoteDataSouce, productsRrequestDomainToDataMapper: .init(),
                                  productDataToDomainModelMapper: .init())
    }

    container.register(ProductDataSouce.self) { resolver in
      return ProductRemoteDataSouce(productApiToDataModelMapper: .init(),
                                    productDetailsApiToDataModelMapper: .init(), 
                                    networkService: DefaultNetworkService(session: URLSession.shared))
    }
  }
}
