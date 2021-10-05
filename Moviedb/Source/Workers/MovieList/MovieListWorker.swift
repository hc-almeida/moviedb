//
//  MovieListWorker.swift
//  Moviedb
//
//  Created by Hellen on 12/06/21.
//

import Foundation

typealias MovieListResult = (Result<MovieListResponse, MovieError>) -> Void

protocol MovieListWorkerProtocol {
    
    var currentPage: Int { get }

    func nextPage()

    func fetchMovieList(section: Section,
                        completion: @escaping MovieListResult)
    
    func fetchMovieList(searchText: String,
                        completion: @escaping MovieListResult)
}

class MovieListWorker: MovieListWorkerProtocol {
    
    // MARK: - Public Properties
    
    var currentPage = 1
    
    // MARK: - Public Functions
    
    func nextPage() {
        self.currentPage += 1
    }
    
    func fetchMovieList(section: Section, completion: @escaping MovieListResult) {
        let url = MovieAPI.build(section: section, page: currentPage)
        
        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }
    
    func fetchMovieList(searchText: String, completion: @escaping MovieListResult) {
        let url = MovieAPI.build(textSearch: searchText, page: currentPage)

        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }
}
