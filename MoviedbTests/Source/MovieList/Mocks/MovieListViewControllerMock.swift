//
//  MovieListViewControllerMock.swift
//  MoviedbTests
//
//  Created by Hellen on 04/10/21.
//

@testable import Moviedb

class MovieListViewControllerMock: MovieListViewControllerProtocol {
    
    // MARK: - VIP properties
    
    var interactor: MovieListInteractorProtocol!
    
    // MARK: - Public properties
    
    private(set) var movieList: [MovieViewModel] = []
    
    private(set) var errorMessage: String?
    
    private(set) var showMovieListCalled = false
    
    private(set) var showMovieListErrorCalled = false
    
    // MARK: - Public functions
    
    func showMovieList(_ viewModel: MovieListViewModel) {
        self.movieList.append(contentsOf: viewModel.movies)
        self.showMovieListCalled = true
    }
    
    func showMovieListError(_ errorMessage: String) {
        self.errorMessage = errorMessage
        self.showMovieListErrorCalled = true
    }
    
    func reloadMovies(_ viewModel: MovieListViewModel, animated: Bool) {
        self.movieList = viewModel.movies
    }
}
