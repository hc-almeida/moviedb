//
//  MovieListViewController.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit

protocol MovieListViewControllerProtocol: AnyObject {
    
    func showMovieList(_ movieList: [Movie])
    
    func showMovieListError(_ errorMessage: String)
}

class MovieListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: MovieListInteractorProtocol!
    
    var router: MovieListRouterProtocol!
    
    private lazy var movieListView: MovieListView = {
        return MovieListView(self)
    }()
    
    override func loadView() {
        self.view = movieListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fecthMovieList()
    }
    
    private func fecthMovieList() {
        showLoading()
        interactor.fecthMovieList()
    }
    
}

extension MovieListViewController: MovieListViewControllerProtocol {

    func showMovieList(_ movieList: [Movie]) {
        movieListView.set(movieList)
        hideLoading()
    }
    
    func showMovieListError(_ errorMessage: String) {
        showMessage(title: "", message: errorMessage)
    }
}

extension MovieListViewController: MovieListViewDelegate {
    
    func fetchMovieListNextPage() {
        showLoading()
        interactor.fetchNextPage()
    }
}
