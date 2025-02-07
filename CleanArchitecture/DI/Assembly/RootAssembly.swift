//
//  RootAssembly.swift
//  CleanArchitecture
//
//  Created by Artak Tsatinyan on 12.09.23.
//

import Foundation
import Swinject

@MainActor var container: Container = {
    let container = Container()
    let rootAssembly = RootAssembly()
    rootAssembly.assemble(container: container)
    return container
}()

@MainActor
class RootAssembly: @preconcurrency Assembly {
    func assemble(container: Container) {
        UIAssembly().assemble(container: container)
        DomainAssembly().assemble(container: container)
        PresentationAssembly().assemble(container: container)
        DataAssembly().assemble(container: container)
    }
}
