//
//  MovieListViewController.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit

protocol MovieListViewControllerProtocol: AnyObject {
    
    func showMovieList(_ movieList: [Movie])
}

class MovieListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: MovieListInteractorProtocol!
    
    var router: MovieListRouterProtocol!
    
    private let movieListView: MovieListView = {
        return MovieListView(delegate: self)
    }()
    
    override func loadView() {
        self.view = movieListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fecthMovieList()
    }
    
}

extension MovieListViewController: MovieListViewControllerProtocol {
    
    func showMovieList(_ movieList: [Movie]) {
        movieListView.setup(movieList)
    }
}

extension MovieListViewController: MovieListViewDelegate {
    
    func fetchMovieListNextPage() {
        
    }
}
