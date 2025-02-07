//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 02.09.23.
//

import Foundation

public struct GetProductsDomainModel: Sendable {
    public init(count: Int, offset: Int) {
        self.count = count
        self.offset = offset
    }

    public let count: Int
    public let offset: Int
}
