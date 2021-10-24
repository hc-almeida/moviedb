//
//  MovieListViewController.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit

protocol MovieListViewControllerProtocol: AnyObject {
    
    func showMovieList(_ viewModel: MovieListViewModel)
    
    func showMovieListError(_ errorMessage: String)
    
    func reloadMovies(_ viewModel: MovieListViewModel, animated: Bool)
}

class MovieListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: MovieListInteractorProtocol!
    
    var router: MovieListRouterProtocol!

    // MARK: - Private Properties
    
    private var searchTask: DispatchWorkItem?
    
    // MARK: - View Lifecycle
    
    private lazy var movieListView: MovieListView = {
        return MovieListView(self)
    }()
    
    override func loadView() {
        self.view = movieListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        fecthMovieList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        interactor.reloadMovies(animated: true)
    }
    
    // MARK: - Private Functions
    
    private func fecthMovieList() {
        startLoading()
        interactor.reset()
        interactor.fecthMovieList()
    }
    
    private func searchForMovie(_ movieName: String) {
        startLoading()
        interactor.reset()
        interactor.searchMovieList(movieName)
        stopLoading()
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.textColor = .black
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupNavigation() {
        navigationItem.title = "Filmes"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

// MARK: - MovieListViewControllerProtocol Extension

extension MovieListViewController: MovieListViewControllerProtocol {
   
    func reloadMovies(_ viewModel: MovieListViewModel, animated: Bool) {
        movieListView.reloadMovies(viewModel.movies, animated: animated)
    }
    
    func showMovieList(_ viewModel: MovieListViewModel) {
        movieListView.set(viewModel.movies)
        stopLoading()
    }

    func showMovieListError(_ errorMessage: String) {
        showMessage(title: "", message: errorMessage)
    }
}

// MARK: - MovieListViewDelegate Extension

extension MovieListViewController: MovieListViewDelegate {

    func fetchMovieListNextPage() {
        startLoading()
        interactor.fetchNextPage()
    }
    
    func selectMovie(at index: Int) {
        interactor.select(at: index)
        router.proceedToMovieDetails()
    }
}

// MARK: - UISearchBarDelegate Extension

extension MovieListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else { return }
        
        searchTask?.cancel()
        
        let newSearchTask = DispatchWorkItem { [weak self] in
            DispatchQueue.main.async {
                self?.searchForMovie(searchText)
            }
        }
        
        searchTask = newSearchTask
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + 0.8,
            execute: newSearchTask)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fecthMovieList()
    }
}
