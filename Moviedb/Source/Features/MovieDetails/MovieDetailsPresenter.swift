//
//  MovieDetailsPresenter.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import Foundation
import MDCore

protocol MovieDetailsPresenterProotocol {
    
    func showLoading()
    
    func dismissLoading()
    
    func showMovieDetails(_ movie: Movie, response: MovieDetailsResponse?)
    
    func showMovieDetailsError(_ error: MovieError?)
}

class MovieDetailsPresenter: MovieDetailsPresenterProotocol {

    // MARK: - VIP Properties
    
    weak var viewController: MovieDetailsViewControllerProtocol!
    
    // MARK: - Public functions
    
    func showLoading() {
        viewController.showLoading()
    }
    
    func dismissLoading() {
        viewController.dismissLoading()
    }
    
    func showMovieDetails(_ movie: Movie, response: MovieDetailsResponse?) {
        guard let movieDetails = response else {
            showMovieDetailsError()
            return
        }
        
        let details = Details(movieDetails)
        viewController.showMovieDetails(movie, detail: details)
    }
    
    func showMovieDetailsError(_ error: MovieError? = nil) {
        viewController.showMovieListError(error?.errorDescription ?? "")
    }
}
