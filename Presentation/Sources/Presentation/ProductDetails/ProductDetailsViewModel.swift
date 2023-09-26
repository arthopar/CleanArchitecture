//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 01.09.23.
//

import Foundation
import Combine

public class ProductDetailsViewModel: ProductDetailsViewModeling {
  private let productUpdatedSubject = PassthroughSubject<ProductDetailsPresentationModel, Never>()

  public init() {}
  
  public var productUpdatedPublisher: AnyPublisher<ProductDetailsPresentationModel, Never> {
    productUpdatedSubject.eraseToAnyPublisher()
  }

  public func viewDidLoad() {

  }
  
  public func productSelectedAction(index: Int) {

  }
}
