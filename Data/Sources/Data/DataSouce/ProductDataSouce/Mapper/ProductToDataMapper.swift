//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 06.09.23.
//

import Foundation

public final class ProductToDataMapper: Sendable {
    public init() {}

    public func map(_ model: ProductRemoteModel) -> ProductDataModel {
        .init(id: model.id,
              name: model.name,
              brand: model.brand)
    }
}
