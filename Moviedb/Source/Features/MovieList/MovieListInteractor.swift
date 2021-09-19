//
//  MovieListInteractor.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation

protocol MovieListDataStoreProtocol {
    
    var movie: Movie? { get set }
}

protocol MovieListInteractorProtocol: MovieListDataStoreProtocol {
    
    func fecthMovieList()
    
    func fetchNextPage()
    
    func select(at index: Int)
}

class MovieListInteractor: MovieListInteractorProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: MovieListPresenterProtocol!
    
    // MARK: - Public Properties
    
    var movie: Movie?
    
    // MARK: - Private Properties
    
    private var movieList: [Movie] = []
    
    private let movieWorker: MovieWorkerProtocol
    
    // MARK: - Inits
    
    init() {
        self.movieWorker = MovieWorker()
    }
    
    func fecthMovieList() {
        movieWorker.fetchMovieList(section: .popular) { [unowned self] result in
            switch result {
            case .success(let response):
                self.didFetchMovieWithSuccess(response)
            case .failure(let error):
                self.didFetchFailure(error)
            }
        }
    }
    
    func fetchNextPage() {
        movieWorker.nextPage()
        fecthMovieList()
    }
    
    func select(at index: Int) {
        movie = movieList[index]
        print("$$$%%%&&&****** TESTE AQUI ==== \(movie)")
    }
    
    // MARK: - Private Functions

    private func didFetchMovieWithSuccess(_ response: MovieListResponse) {
        let movieList = response.results
        presentMovie(movieList)
    }
    
    private func presentMovie(_ movies: [Movie]) {
        presenter.showMovieList(movies)
        movieList.append(contentsOf: movies)
    }
    
    private func didFetchFailure(_ error: MovieError) {
        presenter.showMovieListError(error)
    }
}


// To do:

// Implementar lógica para nextPage

// Entender o porque ao passar dados para proximas tela está quebrando
