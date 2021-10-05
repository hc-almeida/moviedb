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
    
    var movieList: [MovieViewModel] = []
    
    var errorMessage: String?
    
    var showMovieListCalled = false
    
    var showMovieListErrorCalled = false
    
    // MARK: - Public functions
    
    func showMovieList(_ viewModel: MovieListViewModel) {
        movieList.append(contentsOf: viewModel.movies)
        showMovieListCalled = true
    }
    
    func showMovieListError(_ errorMessage: String) {
        self.errorMessage = errorMessage
        showMovieListErrorCalled = true
    }
    
    func reloadMovies(_ viewModel: MovieListViewModel, animated: Bool) {
        movieList = viewModel.movies
    }
}
