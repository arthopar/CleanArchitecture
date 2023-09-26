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
import UI

class PresentationAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ProductViewModeling.self) { resolver in
      let getProductsUseCase = resolver.resolve(GetProductsUseCase.self)!
      return ProductViewModel(getProductsUseCase: getProductsUseCase, 
                              productDomainToPresentationMapper: .init())
    }

    container.register(ProductDetailsViewModeling.self) { (resolver, model: ProductDetailsNavigationModel) in
      let getProductDetailsUseCase = resolver.resolve(GetProductDetailsUseCase.self)!
      return ProductDetailsViewModel(productId: model.productId,
                                     getProductDetailsUseCase: getProductDetailsUseCase)
    }
  }
}

