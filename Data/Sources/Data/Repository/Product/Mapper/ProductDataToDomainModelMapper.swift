//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Foundation
import Domain

public class ProductDataToDomainModelMapper {
  public init() {}

  func map(_ model: ProductDataModel) -> ProductDomainModel {
    .init(id: model.id,
          name: model.name,
          brand: model.brand)
  }
}
