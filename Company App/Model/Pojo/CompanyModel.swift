//
//  Company.swift
//  Company App
//
//  Created by Donia Elshenawy on 25/09/2022.
//

import Foundation

struct CompanyModel: Codable {
    let networks: [Network]
}

// MARK: - Network
struct Network: Codable {
    let id: String
    let location: Location
    let name: String
    

    enum CodingKeys: String, CodingKey {
        case id
        case location
        case name
    }
}

// MARK: - Location
struct Location: Codable {
    let city, country: String
    let latitude, longitude: Double
}

