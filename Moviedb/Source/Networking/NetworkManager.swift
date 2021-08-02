//
//  NetworkManager.swift
//  Moviedb
//
//  Created by Hellen on 12/06/21.
//

import Alamofire

typealias NetworkResult<T: Decodable> = ((Result<T, MovieError>) -> Void)

protocol NetworkManagerProtocol {
    
    static func request <T: Decodable>(url: String, completion: @escaping NetworkResult<T>)
}

class NetworkManager: NetworkManagerProtocol {
    
    static func request<T>(url: String, completion: @escaping NetworkResult<T>) {
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let data = response.data ?? Data()
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                    
                } catch {
                    completion(.failure(.decodeError))
                }
                
            case .failure:
                completion(.failure(.networkError))
            }
        }
    }
}
