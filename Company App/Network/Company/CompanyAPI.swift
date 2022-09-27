//
//  CompanyAPI.swift
//  Company App
//
//  Created by Donia Elshenawy on 25/09/2022.
//

import Foundation

class CompanyAPI: BaseAPI<CompanyNetworking> {
    
    func getData(completion: @escaping(Result<CompanyModel?, NSError>) -> Void) {
        self.fetchDatafromAPI(target: .getCompanyData, response: CompanyModel.self) { result in
            completion(result)
        }
    }
}
