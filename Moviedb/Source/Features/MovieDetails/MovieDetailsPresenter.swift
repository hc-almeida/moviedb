//
//  MovieDetailsPresenter.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import Foundation

protocol MovieDetailsPresenterProotocol {
    
    func showMovieDetails(_ response: MovieDetailsResponse?)
    
    func showMovieDetailsError(_ error: MovieError?)
}

class MovieDetailsPresenter: MovieDetailsPresenterProotocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: MovieDetailsViewControllerProtocol!
    
    // MARK: - Public functions
    
    func showMovieDetails(_ response: MovieDetailsResponse?) {
        guard let movieDetails = response else {
            showMovieDetailsError()
            return
        }
        
        let details = Details(movieDetails)
        viewController.showMovieDetails(details)
    }
    
    func showMovieDetailsError(_ error: MovieError? = nil) {
        viewController.showMovieListError(error?.errorDescription ?? "")
    }
}
