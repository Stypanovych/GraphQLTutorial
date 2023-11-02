//
//  ContentView.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 29/10/2023.
//

import SwiftUI

struct ContentView<ViewModel: ContentViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        EmptyView()
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}


