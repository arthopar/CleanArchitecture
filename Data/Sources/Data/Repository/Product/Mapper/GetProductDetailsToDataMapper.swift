//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Foundation
import Domain

public class GetProductDetailsToDataMapper {
  public init() {}

  func map(_ model: GetProductDetailsDomainModel) -> GetProductDetailsDataModel {
    .init(id: model.id)
  }
}
