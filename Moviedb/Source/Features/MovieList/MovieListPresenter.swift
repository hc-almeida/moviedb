//
//  MovieListPresenter.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation

protocol MovieListPresenterProtocol {
    
    func showMovieList(_ movieList: [Movie])
}

class MovieListPresenter: MovieListPresenterProtocol  {
    
    // MARK: - VIP Properties
    
    weak var viewController: MovieListViewControllerProtocol!
    
    func showMovieList(_ movieList: [Movie]) {
        viewController.showMovieList(movieList)
    }
    
}
