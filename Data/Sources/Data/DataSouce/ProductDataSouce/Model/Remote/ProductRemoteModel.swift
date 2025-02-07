//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 04.09.23.
//

import Foundation

public struct ProductRemoteModel: SafeDecodable {
    public let id: Int
    public let name: String
    public let brand: String
}

extension Array: SafeDecodable where Element: SafeDecodable {
    
}
