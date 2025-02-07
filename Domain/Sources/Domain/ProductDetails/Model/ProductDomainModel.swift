//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 02.09.23.
//

import Foundation

public struct ProductDomainModel: Sendable {
    public let id: Int
    public let name: String
    public let brand: String

    public init(id: Int, name: String, brand: String) {
        self.id = id
        self.name = name
        self.brand = brand
    }
}
