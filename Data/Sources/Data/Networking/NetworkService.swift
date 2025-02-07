//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

public protocol NetworkService: Sendable {
    func request<T: SafeDecodable>(_ endpoint: Endpoint) async throws -> T
}

public protocol SafeDecodable: Sendable, Decodable {

}
