//
//  MovieDetailsViewController.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import UIKit

protocol MovieDetailsViewControllerProtocol: AnyObject {
    
    func showLoading()
    
    func dismissLoading()
    
    func showMovieDetails(_ movie: Movie, detail: Details)
    
    func showMovieListError(_ errorMessage: String)
}

class MovieDetailsViewController: UIViewController {
 
    // MARK: - VIP Properties
    
    var interactor: MovieDetailsInteractorProtocol!
    
    var router: MovieDetailsRouterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var movieDetailsView: MovieDetailsView = {
        return MovieDetailsView(self)
    }()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        self.view = movieDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetails()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupNavigation()
    }
    
    // MARK: - Private functions
    
    private func fetchMovieDetails() {
        interactor.fetchMovieDetails()
    }
    
    private func setupNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - MovieDetailsViewControllerProtocol Extension

extension MovieDetailsViewController: MovieDetailsViewControllerProtocol {
    
    func showLoading() {
        startLoading()
    }
    
    func dismissLoading() {
        stopLoading()
    }
    
    func showMovieDetails(_ movie: Movie, detail: Details) {
        movieDetailsView.setup(movie, details: detail)
    }

    func showMovieListError(_ errorMessage: String) {
        showMessage(title: "", message: errorMessage)
    }
}

// MARK: - MovieDetailsViewDelegate Extension

extension MovieDetailsViewController: MovieDetailsViewDelegate {
    
    func close() {
        navigationController?.popViewController(animated: true)
    }
}
