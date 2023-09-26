//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Foundation
import Domain

public class GetProductsRrequestDomainToDataMapper {
  public init() {}

  func map(_ model: GetProductsDomainModel) -> GetProductsDataModel {
    .init(count: model.count,
          offset: model.offset)
  }
}
