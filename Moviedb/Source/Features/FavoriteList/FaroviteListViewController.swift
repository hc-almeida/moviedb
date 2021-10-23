//
//  FaroviteListViewController.swift
//  Moviedb
//
//  Created by Hellen on 22/10/21.
//

import UIKit

class FaroviteListViewController: UIViewController, FavoriteListViewDelegate {
    
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

        view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    private func setupNavigation() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}
