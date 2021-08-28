//
//  MovieListPresenter.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation

protocol MovieListPresenterProtocol {
    
    func showMovieList(_ movieList: [Movie])
    
    func showMovieListError(_ error: MovieError)
}

class MovieListPresenter: MovieListPresenterProtocol  {
    
    // MARK: - VIP Properties
    
    weak var viewController: MovieListViewControllerProtocol!
    
    func showMovieList(_ movieList: [Movie]) {
        viewController.showMovieList(movieList)
    }
    
    func showMovieListError(_ error: MovieError) {
        viewController.showMovieListError(
            error.errorDescription ?? "Desculpe, algo deu errado. Tente mais tarde!")
    }
}
