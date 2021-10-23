//
//  FavoriteMovieInteractor.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import Foundation

protocol FavoriteMovieInteractorProtocol {
    
    func getMovie()
    
    func chamarInteractor()
}

class FavoriteMovieInteractor: FavoriteMovieInteractorProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: FavoriteMoviePresenterProtocol!
    
    let favoriteWorker: FavoriteWorkerProtocol
    
    // MARK: - Inits
    
    init() {
      
        self.favoriteWorker = FavoriteWorker()
    }
    
    //MARK: - Public Functions
    
    init(favoriteWorker: FavoriteWorkerProtocol) {
        self.favoriteWorker = favoriteWorker
    }
    
    func chamarInteractor() {
        print("chamou")
    }
    
    func getMovie() {
        let movies = favoriteWorker.get()
//        presenter.getMovie(movies: movies)
    }
}
