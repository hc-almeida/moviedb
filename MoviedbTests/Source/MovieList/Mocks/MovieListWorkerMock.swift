//
//  MovieListWorkerMock.swift
//  MoviedbTests
//
//  Created by Hellen on 05/10/21.
//

@testable import Moviedb

class MovieListWorkerSuccessMock: MovieListWorkerProtocol {
    
    var currentPage = 1
    
    func nextPage() {
        currentPage += 1
    }
    
    func fetchMovieList(section: Section, completion: @escaping MovieListResult) {
        completion(.success(MovieListResponseMock.build(page: currentPage)))
    }
    
    func fetchMovieList(searchText: String, completion: @escaping MovieListResult) {
        completion(.success(MovieListResponseMock.build(page: currentPage)))
    }
}

class MovieListWorkerFailedMock: MovieListWorkerProtocol {
    
    var currentPage = 1
    
    func nextPage() {
        currentPage += 1
    }
    
    func fetchMovieList(section: Section, completion: @escaping MovieListResult) {
        completion(.failure(.decodeError))
    }
    
    func fetchMovieList(searchText: String, completion: @escaping MovieListResult) {
        completion(.failure(.networkError))
    }
}
