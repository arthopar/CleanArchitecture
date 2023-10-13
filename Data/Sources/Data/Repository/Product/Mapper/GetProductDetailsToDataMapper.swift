//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Domain
import Foundation

public class GetProductDetailsToDataMapper {
    public init() {}

    func map(_ model: GetProductDetailsDomainModel) -> GetProductDetailsDataModel {
        .init(id: model.id)
    }
}
