//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

public protocol NetworkService {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
