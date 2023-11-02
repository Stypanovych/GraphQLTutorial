//
//  GrapthQLTutorialApp.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 29/10/2023.
//

import SwiftUI

@main
struct GrapthQLTutorialApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
