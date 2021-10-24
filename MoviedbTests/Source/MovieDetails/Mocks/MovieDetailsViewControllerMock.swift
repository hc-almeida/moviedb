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
    
    private(set) var details: Details?
    
    private(set) var movie: Movie?
    
    private(set) var errorMessage: String?
    
    private(set) var showMovieDetailsCalled = false
    
    private(set) var showMovieDetailsErrorCalled = false
    
    private(set) var showLoadingCalled = false
    
    private(set) var dismissLoadingCalled = false
    
    //MARK: - Public functions
    
    func showLoading() {
        self.showLoadingCalled = true
    }
    
    func dismissLoading() {
        self.dismissLoadingCalled = true
    }
    
    func showMovieDetails(_ movie: Movie, detail: Details) {
        self.details = detail
        self.movie = movie
        self.showMovieDetailsCalled = true
    }
    
    func showMovieListError(_ errorMessage: String) {
        self.errorMessage = errorMessage
        self.showMovieDetailsErrorCalled = true
    }
}
