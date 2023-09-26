//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 09.09.23.
//

import Foundation

struct ProductEndpoint: Endpoint {
  init(offset: Int, limit: Int) {
    self.offset = offset
    self.limit = limit
  }
  
  let path: String = "/product"

  var queryItems: [URLQueryItem] {
    [URLQueryItem(name: "offset", value: "\(offset)"),
     URLQueryItem(name: "limit", value: "\(limit)")]
  }

  private let offset: Int
  private let limit: Int
}
