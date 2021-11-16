//
//  MovieListPresenter.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation
import MDCore

protocol MovieListPresenterProtocol {
    
    func showMovieList(_ movieList: [Movie])
    
    func showMovieListError(_ error: MovieError)
    
    func reloadMovies(_ movieList: [Movie], animated: Bool)
}

class MovieListPresenter: MovieListPresenterProtocol  {
    
    // MARK: - VIP Properties
    
    weak var viewController: MovieListViewControllerProtocol?
    
    // MARK: - Public Functions
    
    func showMovieList(_ movieList: [Movie]) {
        let viewModel = buildViewModel(movieList)
        viewController?.showMovieList(viewModel)
    }
    
    func showMovieListError(_ error: MovieError) {
        viewController?.showMovieListError(
            error.errorDescription ?? "Desculpe, algo deu errado. Tente mais tarde!")
    }
    
    func reloadMovies(_ movieList: [Movie], animated: Bool) {
        let viewModel = buildViewModel(movieList)
        viewController?.reloadMovies(viewModel, animated: animated)
    }
    
    // MARK: - Private Functions
    
    private func buildViewModel(_ results: [Movie]) -> MovieListViewModel {
         
        let movie = results.map { movie in
            MovieViewModel(
                name: movie.title,
                imagePoster: movie.posterPath ?? "",
                imageBackdropPath: movie.backdropPath ?? "",
                overview: movie.overview,
                releaseDate: movie.releaseDate,
                note: String(movie.voteAverage))
        }
        
        return MovieListViewModel(movies: movie)
    }
}
