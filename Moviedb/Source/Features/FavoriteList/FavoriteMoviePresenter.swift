//
//  FavoriteMoviePresenter.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import Foundation

protocol FavoriteMoviePresenterProtocol {
    
    func getMovies(movies: [MovieObject])
}

class FavoriteMoviePresenter: FavoriteMoviePresenterProtocol {
    
    weak var viewController: FavoriteMovieViewControllerProtocol!
    
    func getMovies(movies: [MovieObject]) {
        viewController.getMovies(movies: movies)
    }
    
    
    
}
