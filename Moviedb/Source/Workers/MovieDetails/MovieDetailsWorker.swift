//
//  MovieDetailsWorker.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import Foundation

typealias MovieDetailsResult = (Result<MovieDetailsResponse?, MovieError>) -> Void

protocol MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieID: Int,
                        completion: @escaping MovieDetailsResult)
}

class MovieDetailsWorker: MovieDetailsWorkerProtocol {
    
    // MARK: - Public Functions
    
    func fetchMovieDetails(of movieID: Int, completion: @escaping MovieDetailsResult) {
        let url = MovieAPI.build(detailsOf: movieID)
        
        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }
}
