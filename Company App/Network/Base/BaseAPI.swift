//
//  BaseAPI.swift
//  Company App
//
//  Created by Donia Elshenawy on 25/09/2022.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType>{
    func fetchDatafromAPI<M: Decodable>(target: T, response: M.Type, completion: @escaping(Result<M?, NSError>) -> Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let header = Alamofire.HTTPHeaders(target.headers)
        let parameters = buildParamter(task: target.paramters)
        AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: header).response { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else { return  }
            if statusCode <= 299 {
                switch dataResponse.result{
                case .success(let data):
                    if let decodedData = try? JSONDecoder().decode(M.self, from: data!){
                        completion(.success(decodedData))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }   
    }
    
    private func buildParamter(task: Task) -> ([String: Any], ParameterEncoding){
        switch task{
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParamter(Parameters: let Parameters, encoding: let encoding):
            return (Parameters, encoding)
        }
    }
}
