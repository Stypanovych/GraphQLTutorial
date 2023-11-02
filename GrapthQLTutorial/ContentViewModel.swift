//
//  ContentViewModel.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 29/10/2023.
//

import Foundation
import Combine

@MainActor
protocol ContentViewModelProtocol: ObservableObject {
    func fetchData()
}

class ContentViewModel: ContentViewModelProtocol {

    private var cancellables = Set<AnyCancellable>()
    private let launchProvider: LaunchProviderProtocol
    init(launchProvider: LaunchProviderProtocol = ServiceContainer.shared.launchProvider) {
        self.launchProvider = launchProvider
    }

    func fetchData() {
        launchProvider.fetchLaunchList()
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    break
                }
            } receiveValue: { _ in

            }.store(in: &cancellables)
    }
}
