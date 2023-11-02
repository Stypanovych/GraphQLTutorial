//
//  Network.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 29/10/2023.
//

import Foundation
import Apollo

protocol NetworkProtocol {
    var apollo: ApolloClientProtocol { get }
}

class Network: NetworkProtocol {

    private(set) lazy var apollo: ApolloClientProtocol = {
        let cache = InMemoryNormalizedCache()
        let apolloStore = ApolloStore(cache: cache)
        let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!
        let interceptorProvider = DefaultInterceptorProvider(store: apolloStore)
        let transport = RequestChainNetworkTransport(interceptorProvider: interceptorProvider, endpointURL: url)

        return ApolloClient(networkTransport: transport, store: apolloStore)
    }()
}
