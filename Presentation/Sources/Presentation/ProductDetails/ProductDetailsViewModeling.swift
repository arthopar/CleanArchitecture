//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 31.08.23.
//

import Foundation
import Combine

public protocol ProductDetailsViewModeling: AnyObject {
  var productUpdatedPublisher: AnyPublisher<ProductDetailsPresentationModel, Never> { get }
  func viewDidLoad()
  func productSelectedAction(index: Int)
}
