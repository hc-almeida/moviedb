//
//  MovieListBuilderMock.swift
//  MoviedbTests
//
//  Created by Hellen on 04/10/21.
//

@testable import Moviedb

class MovieListBuilderMock {
    
    func build(movieListWorker: MovieListWorkerProtocol) -> MovieListViewControllerMock {
        let viewController = MovieListViewControllerMock()
        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor(movieListWorker: movieListWorker)
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
