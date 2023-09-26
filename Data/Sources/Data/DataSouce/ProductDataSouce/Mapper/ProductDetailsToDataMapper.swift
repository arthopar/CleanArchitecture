//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Foundation

public class ProductDetailsToDataMapper {
  public init() {}

  public func map(_ model: ProductDetailsRemoteModel) -> ProductDetailsDataModel {
    .init(id: model.id,
          name: model.name ?? "",
          brand: model.brand ?? "",
          sizeCode: model.sizeCode ?? "",
          stars: model.stars ?? 0)
  }
}
