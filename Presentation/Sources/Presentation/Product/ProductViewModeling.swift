//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 31.08.23.
//

import Combine
import Foundation

@MainActor
public protocol ProductViewModeling: AnyObject {
    var productUpdatedPublisher: AnyPublisher<[ProductPresentationModel], Never> { get }
    var openProductPublisher: AnyPublisher<Int, Never> { get }
    var shouldShowLoaderPublisher: AnyPublisher<Bool, Never> { get }

    func viewDidLoad()
    func productSelectedAction(index: Int)
}
