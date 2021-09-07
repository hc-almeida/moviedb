//
//  MovieDetailsBuilder.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import UIKit

struct MovieDetailsBuilder {
    
    static func build() -> UIViewController {
        let viewController = MovieDetailsViewController()
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        let router = MovieDetailsRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
