//
//  Network.swift
//  Company App
//
//  Created by Donia Elshenawy on 29/09/2022.
//

import Foundation

// MARK: - NetworkModel
struct Network: Codable {
    let id: String
    let location: Location
    let name: String
}
