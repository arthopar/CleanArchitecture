//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

public final class DefaultNetworkService: NetworkService {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func request<T: SafeDecodable>(_ endpoint: Endpoint) async throws -> T {
        do {
            let (data, _) = try await session.data(for: endpoint.request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.networkError(error)
        }
    }
}
