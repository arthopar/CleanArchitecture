//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 31.08.23.
//

import Combine
import Foundation

public protocol ProductDetailsViewModeling: AnyObject {
    var productUpdatedPublisher: AnyPublisher<ProductDetailsPresentationModel, Never> { get }
    func viewDidLoad()
    func productSelectedAction(index: Int)
}
