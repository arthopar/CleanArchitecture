//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 01.09.23.
//

import Foundation
import Combine
import Domain

public class ProductViewModel: ProductViewModeling {
  private let shouldShowLoaderSubject = PassthroughSubject<Bool, Never>()
  private let openProductSubject = PassthroughSubject<Int, Never>()
  private let productUpdatedSubject = PassthroughSubject<[ProductPresentationModel], Never>()
  private let productDomainToPresentationMapper: ProductDomainToPresentationMapper
  private let getProductsUseCase: GetProductsUseCase

  private var products: [ProductDomainModel] = []

  public init(getProductsUseCase: GetProductsUseCase,
              productDomainToPresentationMapper: ProductDomainToPresentationMapper) {
    self.getProductsUseCase = getProductsUseCase
    self.productDomainToPresentationMapper = productDomainToPresentationMapper
  }
  
  public var productUpdatedPublisher: AnyPublisher<[ProductPresentationModel], Never> {
    productUpdatedSubject.eraseToAnyPublisher()
  }

  public var openProductPublisher: AnyPublisher<Int, Never> {
    openProductSubject.eraseToAnyPublisher()
  }

  public var shouldShowLoaderPublisher: AnyPublisher<Bool, Never> {
    shouldShowLoaderSubject.eraseToAnyPublisher()
  }

  public func viewDidLoad() {
    shouldShowLoaderSubject.send(true)
    Task {
      let request = GetProductsDomainModel(count: 10, offset: 0)
      products = try await getProductsUseCase.execute(params: request)
      let models = products.map { productDomainToPresentationMapper.map($0) }
      productUpdatedSubject.send(models)
      shouldShowLoaderSubject.send(false)
    }
  }
  
  public func productSelectedAction(index: Int) {
    let model = products[index]
    openProductSubject.send(model.id)
  }
}
