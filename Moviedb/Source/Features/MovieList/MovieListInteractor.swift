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
    
    func reset()
    
    func fecthMovieList()
    
    func fetchNextPage()

    func searchMovieList(_ movieName: String)
    
    func reloadMovies(animated: Bool)
    
    func select(at index: Int)
}

class MovieListInteractor: MovieListInteractorProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: MovieListPresenterProtocol!
    
    // MARK: - Public Properties
    
    var movie: Movie?
    
    // MARK: - Private Properties

    private var searchText = ""
    
    private var movieList: [Movie] = []
    
    private let movieListWorker: MovieListWorkerProtocol
    
    // MARK: - Inits
    
    init() {
        self.movieListWorker = MovieListWorker()
    }
    
    init(movieListWorker: MovieListWorkerProtocol) {
        self.movieListWorker = movieListWorker
    }
    
    // MARK: - Public Functions
    
    func fecthMovieList() {
        movieListWorker.fetchMovieList(section: .popular) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.didFetchMovieWithSuccess(response)
            case .failure(let error):
                self.didFetchFailure(error)
            }
        }
    }
    
    func searchMovieList(_ movieName: String) {
        let movieNameTrimmed = movieName.trimmingCharacters(in: .whitespacesAndNewlines)
        searchText = movieNameTrimmed.capitalized
        
        movieListWorker.fetchMovieList(searchText: searchText) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.didFetchMovieWithSuccess(response)
            case .failure(let error):
                self.didFetchFailure(error)
            }
        }
    }
    
    func reset() {
        movieList = []
        searchText = ""
        reloadMovies(animated: true)
    }
    
    func fetchNextPage() {
        movieListWorker.nextPage()
        fecthMovieList()
    }
    
    func select(at index: Int) {
        movie = movieList[index]
    }
    
    func reloadMovies(animated: Bool) {
        presenter.reloadMovies(movieList, animated: animated)
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
