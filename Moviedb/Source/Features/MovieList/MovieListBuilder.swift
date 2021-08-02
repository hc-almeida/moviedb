//
//  MovieListBuilder.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit

struct MovieListBuilder {
    
    static func build() -> UIViewController {
        let viewController = MovieListViewController()
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let router = MovieListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
