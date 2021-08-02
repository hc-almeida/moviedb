//
//  MovieWorker.swift
//  Moviedb
//
//  Created by Hellen on 12/06/21.
//

import Foundation

typealias MovieListResult = (Result<MovieListResponse, MovieError>) -> Void

protocol MovieWorkerProtocol {
    
    var currentPage: Int { get }
    
    func nextPage()
    
    func fetchMovieList(section: Section,
                        completion: @escaping MovieListResult)
}

class MovieWorker: MovieWorkerProtocol {
    
    var currentPage = 1
    
    func nextPage() {
        self.currentPage += 1
    }
    
    func fetchMovieList(section: Section, completion: @escaping MovieListResult) {
        let url = MovieAPI.build(section: section, page: currentPage)
        
        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }
}
