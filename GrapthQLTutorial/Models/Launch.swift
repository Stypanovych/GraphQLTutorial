//
//  Launch.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 02/11/2023.
//

import Foundation

struct Launch: Codable {
    var id: String
    var site: String?
    var mission: Mission?
    var rocket: Rocket?
    var isBooked: Bool
}
