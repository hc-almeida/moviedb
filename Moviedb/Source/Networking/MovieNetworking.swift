//
//  MovieNetworking.swift
//  Moviedb
//
//  Created by Hellen Caroline on 02/02/21.
//

import Foundation
import UIKit
import Alamofire

class MovieNetworking {
    
    private let apiKey = "b1397dd7e9b6d6b5e6e0023db0b88e27"
    private let baseUrl = "https://api.themoviedb.org/3/"
    
    typealias RequestError = () -> Void
    typealias RequestSuccess = (_ response: AFDataResponse<Any>) -> Void
    
    func request(endpoint: String, success: @escaping RequestSuccess, failure: @escaping RequestError) {
        
        let url = baseUrl + endpoint + apiKey
        
        AF.request(url).validate().responseJSON { response in
            switch response.result {
            case .success:
                success(response)
            case .failure:
                failure()
            }
        }
    }
}
