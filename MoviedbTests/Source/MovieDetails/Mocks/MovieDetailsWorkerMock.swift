//
//  MovieDetailsWorkerMock.swift
//  MoviedbTests
//
//  Created by Hellen on 05/10/21.
//

@testable import Moviedb

class MovieDetailsWorkerSuccessMock: MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieID: Int, completion: @escaping MovieDetailsResult) {
        completion(.success(MovieDetailsResponseMock.build()))
    }
}

class MovieDetailsWorkerFailureMock: MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieID: Int, completion: @escaping MovieDetailsResult) {
        completion(.failure(.databaseError))
    }
}
