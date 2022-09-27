//
//  Base.swift
//  Company App
//
//  Created by Donia Elshenawy on 25/09/2022.
//

import Foundation
import Alamofire

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
}

enum Task{
    case requestPlain
    case requestParamter(Parameters: [String : Any], encoding: ParameterEncoding)
}

protocol TargetType{
    var baseURL: String { get }
    var path: String { get }
    var paramters: Task { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
}
