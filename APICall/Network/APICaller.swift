//
//  APICaller.swift
//  APICall
//
//  Created by Burak Öztopuz on 4.06.2023.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseDate
}

class APICaller {
    
    static func fetchData(complitionHandler: @escaping (_ result: Result<ModelElement, NetworkError>) -> Void){
        
        let convertUrltoString = NetworkConstanst.shared.serverAddress
        
        guard let serverUrl = URL(string: convertUrltoString) else {
            complitionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: serverUrl) { dataResponse, _, error in
            guard let data = dataResponse, error == nil else{
                complitionHandler(.failure(.canNotParseDate))
                return
            }
            if let resultData = try? JSONDecoder().decode(ModelElement.self, from: data){
                complitionHandler(.success(resultData))
            }
        }.resume()
    }
    
}
