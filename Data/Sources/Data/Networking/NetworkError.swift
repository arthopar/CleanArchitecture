//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingFailed
    case networkError(Error)
}
