//
//  MovieDetailsViewController.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import UIKit

protocol MovieDetailsViewControllerProtocol: AnyObject {
    
    func showMovieDetails(_ movie: Movie, detail: Details)
    
    func showMovieListError(_ errorMessage: String)
}

class MovieDetailsViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: MovieDetailsInteractorProtocol!
    
    var router: MovieDetailsRouterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var movieDetailsView: MovieDetailsView = {
        return MovieDetailsView()
    }()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        self.view = movieDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetails()
    }
    
    // MARK: - Private functions
    
    private func fetchMovieDetails() {
        interactor.fetchMovieDetails()
    }
}

extension MovieDetailsViewController: MovieDetailsViewControllerProtocol {
    
    func showMovieDetails(_ movie: Movie, detail: Details) {
        movieDetailsView.setup(movie, details: detail)
    }

    func showMovieListError(_ errorMessage: String) {
        
    }
}
