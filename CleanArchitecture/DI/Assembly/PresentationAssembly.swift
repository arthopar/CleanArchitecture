//
//  PresentationAssembly.swift
//  CleanArchitecture
//
//  Created by Artak Tsatinyan on 12.09.23.
//

import Foundation
import Swinject
import Presentation
import Domain

class PresentationAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ProductViewModeling.self) { resolver in
      let getProductsUseCase = resolver.resolve(GetProductsUseCase.self)!
      return ProductViewModel(getProductsUseCase: getProductsUseCase, 
                              productDomainToPresentationMapper: .init())
    }
  }
}

