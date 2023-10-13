//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 02.09.23.
//

import Foundation

public struct ProductDetailsDomainModel {
    public let id: Int
    public let name: String
    public let brand: String
    public let sizeCode: String
    public let stars: Int

    public init(id: Int, name: String, brand: String, sizeCode: String, stars: Int) {
        self.id = id
        self.name = name
        self.brand = brand
        self.sizeCode = sizeCode
        self.stars = stars
    }
}
