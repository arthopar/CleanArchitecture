//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Domain
import Foundation

public class GetProductsRrequestDomainToDataMapper {
    public init() {}

    func map(_ model: GetProductsDomainModel) -> GetProductsDataModel {
        .init(count: model.count,
              offset: model.offset)
    }
}
