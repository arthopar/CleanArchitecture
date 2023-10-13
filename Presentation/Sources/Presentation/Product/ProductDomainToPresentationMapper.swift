//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 15.09.23.
//

import Domain
import Foundation

public class ProductDomainToPresentationMapper {
    public init() {}
    func map(_ model: ProductDomainModel) -> ProductPresentationModel {
        .init(name: model.name,
              productDescription: model.brand)
    }
}
