//
//  MovieListInteractor.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation

protocol MovieListInteractorProtocol {
    
    func fecthMovieList()
}

class MovieListInteractor: MovieListInteractorProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: MovieListPresenterProtocol!
    
    private let movieWorker: MovieWorkerProtocol
    
    init() {
        self.movieWorker = MovieWorker()
    }
    
    func fecthMovieList() {
        movieWorker.fetchMovieList(section: .popular) { [unowned self] result in
            switch result {
            case .success(let response):
                self.didFetchWithSuccess(response)
            case .failure(let error):
                self.didFetchFailure(error)
            }
        }
    }
    
    func fetchNextPage() {
        movieWorker.nextPage()
    }
    
    // MARK: - Private Functions
    
    private func didFetchWithSuccess(_ response: MovieListResponse) {
        let movieList = response.results
        presenter.showMovieList(movieList)
    }
    
    private func didFetchFailure(_ error: MovieError) {
        
    }
    
    
    

}
