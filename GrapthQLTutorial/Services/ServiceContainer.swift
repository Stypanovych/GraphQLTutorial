//
//  ServiceContainer.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 02/11/2023.
//

import Foundation

class ServiceContainer {
    static let shared = ServiceContainer()

    private let network = Network()

    lazy var launchProvider = LaunchProvider(network: network)
}
