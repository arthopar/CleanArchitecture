//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 01.09.23.
//

import Foundation
import Combine
import Domain

public class ProductDetailsViewModel: ProductDetailsViewModeling {
  private let productUpdatedSubject = PassthroughSubject<ProductDetailsPresentationModel, Never>()
  private let productId: Int
  private let getProductDetailsUseCase: GetProductDetailsUseCase

  public init(productId: Int, getProductDetailsUseCase: GetProductDetailsUseCase) {
    self.productId = productId
    self.getProductDetailsUseCase = getProductDetailsUseCase
  }

  public var productUpdatedPublisher: AnyPublisher<ProductDetailsPresentationModel, Never> {
    productUpdatedSubject.eraseToAnyPublisher()
  }

  public func viewDidLoad() {

  }
  
  public func productSelectedAction(index: Int) {

  }
}
