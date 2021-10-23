//
//  FavoriteMovieViewController.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import UIKit

protocol FavoriteMovieViewControllerProtocol: AnyObject {
    
    func getMovies(movies: [MovieObject])
}

class FavoriteMovieViewController: UIViewController {
    
    var interactor: FavoriteMovieInteractorProtocol!
    
    var router: FavoriteMovieRouterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var favoriteListView: FavoriteListView = {
        return FavoriteListView(self)
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = favoriteListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        interactor.getMovie()
    }
    
    private func setupNavigation() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}

extension FavoriteMovieViewController: FavoriteListViewDelegate {
    
}


extension FavoriteMovieViewController: FavoriteMovieViewControllerProtocol {

    func getMovies(movies: [MovieObject]) {
        favoriteListView.setup(movies)
    }
    
}
