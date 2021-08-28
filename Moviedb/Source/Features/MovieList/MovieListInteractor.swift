//
//  MovieListInteractor.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation

protocol MovieListInteractorProtocol {
    
    func fecthMovieList()
    
    func fetchNextPage()
}

class MovieListInteractor: MovieListInteractorProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: MovieListPresenterProtocol!
    
    private var movieList: [Movie] = []
    
    private let movieWorker: MovieWorkerProtocol
    
    init() {
        self.movieWorker = MovieWorker()
    }
    
    func fecthMovieList() {
        movieWorker.fetchMovieList(section: .popular) { [unowned self] result in
            switch result {
            case .success(let response):
                self.didFetchMovieWithSuccess(response)
            case .failure(let error):
                self.didFetchFailure(error)
            }
        }
    }
    
    func fetchNextPage() {
        movieWorker.nextPage()
        fecthMovieList()
    }
    
    // MARK: - Private Functions

    private func didFetchMovieWithSuccess(_ response: MovieListResponse) {
        let movieList = response.results
        presenter.showMovieList(movieList)
    }
    
    private func didFetchFailure(_ error: MovieError) {
        presenter.showMovieListError(error)
    }
}
