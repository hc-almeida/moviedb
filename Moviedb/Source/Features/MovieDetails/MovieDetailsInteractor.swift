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
    
    func save()
}

class MovieDetailsInteractor: MovieDetailsInteractorProtocol, MovieDetailsDataStoreProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: MovieDetailsPresenterProotocol!
    
    // MARK: - Public Properties
    
    var movie: Movie!
    
    // MARK: - Private properties
    
    private let movieDetailsWorker: MovieDetailsWorkerProtocol
    
    private let favoriteWorker: FavoriteWorkerProtocol
    
    // MARK: - Inits
    
    init() {
        self.movieDetailsWorker = MovieDetailsWorker()
        self.favoriteWorker = FavoriteWorker()
    }
    
    init(movieDetailsWorker: MovieDetailsWorkerProtocol, favoriteWorker: FavoriteWorkerProtocol) {
        self.movieDetailsWorker = movieDetailsWorker
        self.favoriteWorker = favoriteWorker
    }
    
    // MARK: - Public functions
    
    func fetchMovieDetails() {
        movieDetailsWorker.fetchMovieDetails(of: movie.id) { [unowned self] result in
            switch result {
            case .success(let response):
                presenter.showMovieDetails(movie, response: response)
            case .failure(let error):
                presenter.showMovieDetailsError(error)
            }
        }
    }
    
    func save() {
        favoriteWorker.save(movie)
    }
}
