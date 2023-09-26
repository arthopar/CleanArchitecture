//
//  DomainAssembly.swift
//  CleanArchitecture
//
//  Created by Artak Tsatinyan on 08.09.23.
//

import Foundation
import Swinject
import Domain

class DomainAssembly: Assembly {
  func assemble(container: Container) {
    container.register(GetProductsUseCase.self) { resolver in
      let reposytory = resolver.resolve(ProductRepository.self)!
        return GetProductsUseCaseImp(reposytory: reposytory)
    }

    container.register(GetProductDetailsUseCase.self) { resolver in
      let reposytory = resolver.resolve(ProductRepository.self)!
        return GetProductDetailsUseCaseImp(reposytory: reposytory)
    }
  }
}
