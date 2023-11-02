//
//  LaunchProvider.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 01/11/2023.
//

import Foundation
import LaunchListAPI
import Combine

protocol LaunchProviderProtocol {
    func fetchLaunchList() -> Future<LaunchList?, Error>
}

class LaunchProvider: LaunchProviderProtocol {

    private let network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }

    func fetchLaunchList() -> Future<LaunchList?, Error> {
        Future<LaunchList?, Error> { promise in
            _ = self.network.apollo.fetch(
                query: LaunchListQuery(),
                cachePolicy: .default,
                contextIdentifier: nil,
                context: nil,
                queue: .main
            ) { result in
                switch result {
                case .success(let result):
                    promise(.success(result.data?.toLaunchListModel()))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }
    }
}
