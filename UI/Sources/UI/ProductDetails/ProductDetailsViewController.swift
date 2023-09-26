//
//  File.swift
//  
//
//  Created by Artak Tsatinyan on 29.08.23.
//

import UIKit
import Presentation

public class ProductDetailsViewController: UIViewController {
  weak var coordinator: ProductCoordinator?
  private let viewModel: ProductDetailsViewModeling

  public init(viewModel: ProductDetailsViewModeling) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
