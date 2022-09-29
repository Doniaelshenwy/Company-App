//
//  Location.swift
//  Company App
//
//  Created by Donia Elshenawy on 29/09/2022.
//

import Foundation

// MARK: - LocationModel
struct Location: Codable {
    let city, country: String
    let latitude, longitude: Double
}
