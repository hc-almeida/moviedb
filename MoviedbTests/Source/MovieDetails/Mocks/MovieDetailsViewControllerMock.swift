//
//  MovieDetailsViewControllerMock.swift
//  MoviedbTests
//
//  Created by Hellen on 05/10/21.
//

@testable import Moviedb

class MovieDetailsViewControllerMock: MovieDetailsViewControllerProtocol {
    
    // MARK: - VIP properties
    
    var interactor: MovieDetailsInteractorProtocol!
    
    // MARK: - Public properties
    
    var details: Details?
    
    var movie: Movie?
    
    var errorMessage: String?
    
    var showMovieDetailsCalled = false
    
    var showMovieDetailsErrorCalled = false
    
    //MARK: - Public functions
    
    func showMovieDetails(_ movie: Movie, detail: Details) {
        self.details = detail
        self.movie = movie
        showMovieDetailsCalled = true
    }
    
    func showMovieListError(_ errorMessage: String) {
        self.errorMessage = errorMessage
        showMovieDetailsErrorCalled = true
    }
}
