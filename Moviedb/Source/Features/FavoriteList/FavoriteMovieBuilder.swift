//
//  FavoriteMovieBuilder.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import UIKit

struct FavoriteMovieBuilder {
    
    static func build() -> UIViewController {
        let viewController = FavoriteMovieViewController()
        let interactor = FavoriteMovieInteractor()
        let presenter = FavoriteMoviePresenter()
        let router = FavoriteMovieRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    
        return viewController
    }
}
