//
//  File.swift
//
//
//  Created by Artak Tsatinyan on 29.08.23.
//

import UIKit

@MainActor
public protocol Coordinator: AnyObject {
    func start()
}

public class BaseCoordinator {
    var navigationController: UINavigationController
    private var childCoordinators: [BaseCoordinator] = []
    var onDestroy: (() -> Void)?

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func addCoordinator(childCoordinator: BaseCoordinator) {
        childCoordinators.append(childCoordinator)
        childCoordinator.onDestroy = { [weak self, weak childCoordinator] in
            self?.childCoordinators.removeAll(where: { $0 === childCoordinator })
        }
    }
}
