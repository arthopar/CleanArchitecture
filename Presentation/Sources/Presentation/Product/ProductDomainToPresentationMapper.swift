//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 15.09.23.
//

import Foundation
import Domain

public class ProductDomainToPresentationMapper {
  public init() {}
  func map(_ model: ProductDomainModel) -> ProductPresentationModel {
    .init(name: model.name,
          productDescription: model.brand)
  }
}
