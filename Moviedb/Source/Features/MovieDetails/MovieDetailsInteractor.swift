//
//  MovieDetailsInteractor.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import Foundation

protocol MovieDetailsDataStoreProtocol {
    
    var movie: Movie! { get set }
}

protocol MovieDetailsInteractorProtocol {
    
    func fetchMovieDetails()
}

class MovieDetailsInteractor: MovieDetailsInteractorProtocol, MovieDetailsDataStoreProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: MovieDetailsPresenterProotocol!
    
    // MARK: - Public Properties
    
    var movie: Movie!
    
    // MARK: - Private properties
    
    private let movieDetailsWorker: MovieDetailsWorkerProtocol
    
    // MARK: - Inits
    
    init() {
        self.movieDetailsWorker = MovieDetailsWorker()
    }
    
    init(movieDetailsWorker: MovieDetailsWorkerProtocol) {
        self.movieDetailsWorker = movieDetailsWorker
    }
    
    // MARK: - Public functions
    
    func fetchMovieDetails() {
        presenter.showLoading()
        
        movieDetailsWorker.fetchMovieDetails(of: movie.id) { [weak self] result in
            guard let self = self else { return }
            
            self.presenter.dismissLoading()
            
            switch result {
            case .success(let response):
                self.presenter.showMovieDetails(self.movie, response: response)
            case .failure(let error):
                self.presenter.showMovieDetailsError(error)
            }
        }
    }
}
