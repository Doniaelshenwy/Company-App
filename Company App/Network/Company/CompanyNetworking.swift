//
//  CompanyNetworking.swift
//  Company App
//
//  Created by Donia Elshenawy on 25/09/2022.
//

import Foundation

enum CompanyNetworking{
    case getCompanyData
}

extension CompanyNetworking: TargetType{
    var baseURL: String {
        switch self {
        default:
            return "https://api.citybik.es/v2/networks"
        }
    }
    var path: String {
        switch self {
        default:
            return ""
        }
    }    
    var paramters: Task {
        switch self {
        case .getCompanyData:
            return .requestPlain
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getCompanyData:
            return .get
        }
    }
    var headers: [String : String] {
        switch self {
        case .getCompanyData:
            return [:]
        }
    }
}
