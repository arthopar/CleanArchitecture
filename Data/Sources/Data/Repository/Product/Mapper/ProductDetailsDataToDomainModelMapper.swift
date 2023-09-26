//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Foundation
import Domain

public class ProductDetailsDataToDomainModelMapper {
  public init() {}

  func map(_ model: ProductDetailsDataModel) -> ProductDetailsDomainModel {
    .init(id: model.id,
          name: model.name,
          brand: model.brand,
          sizeCode: model.sizeCode,
          stars: model.stars)
  }
}
