//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var request: URLRequest { get }
}

extension Endpoint {
    var baseURL: URL { URL(string: "https://api.jsonserver.io")! }
    var queryItems: [URLQueryItem] { [] }

    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems

        var request = URLRequest(url: components.url!)
        request.setValue("8772b2b3fd60e6bf1a21ed5eb7682c1e", forHTTPHeaderField: "X-Jsio-Token")

        return request
    }
}
