//
//  MovieListRouter.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation

protocol MovieListRouterProtocol {
    
    func proceedToMovieDetails()
}

protocol CharacterListDataPassingProtocol {
    
    var dataStore: MovieListDataStoreProtocol! { get }
}

class MovieListRouter: MovieListRouterProtocol, CharacterListDataPassingProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: MovieListViewController!
    
    // MARK: - Public Properties
    
    var dataStore: MovieListDataStoreProtocol!
    
    // MARK: - Public Functions
    
    func proceedToMovieDetails() {
        guard let movie = dataStore.movie else { return }
        
        let detailScene = MovieDetailsBuilder.build(movie)
        
        viewController.navigationController?
            .pushViewController(detailScene, animated: true)
    }
}
