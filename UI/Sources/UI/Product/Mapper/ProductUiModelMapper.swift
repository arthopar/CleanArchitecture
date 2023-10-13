//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 14.09.23.
//

import Foundation
import Presentation

class ProductUiModelMapper {
    func map(_ model: ProductPresentationModel) -> ProductUiModel {
        .init(title: model.name, description: model.productDescription)
    }
}
