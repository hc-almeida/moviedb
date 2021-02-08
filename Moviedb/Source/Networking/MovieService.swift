//
//  MovieService.swift
//  Moviedb
//
//  Created by Hellen Caroline on 02/02/21.
//

import Foundation
import Alamofire

class MovieService {
        
    typealias MovieError = () -> Void
    typealias MovieSuccess = (_ movieList: [Movie]) -> Void
    
    private let networking = MovieNetworking()
    
    func fetchMovieList(success: @escaping MovieSuccess, failure: @escaping MovieError) {
      
        let endpoint = "discover/movie?sort_by=popularity.desc&page=1&api_key="
        
        self.networking.request(
            endpoint: endpoint,
            success: { response in
                let data = response.data ?? Data()
                let result = try! JSONDecoder().decode(MovieResult.self, from: data)
                success(result.movies)
            },
            failure: {
                print("Falha")
            })
        
//        self.networking.request(endpoint: endpoint) { (response, error) in
//            if let error = error {
//                completion(nil, error)
//            } else {
//                guard let response = response, let data = response.data else { return }
//
//                do {
//                    let result = try JSONDecoder().decode(MovieResult.self, from: data)
//                    completion(result.movies, nil)
//                } catch {
//                    completion(nil, error)
//                }
//            }
//        }
    }
}
