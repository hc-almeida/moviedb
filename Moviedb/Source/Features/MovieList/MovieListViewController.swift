//
//  MovieListViewController.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit

protocol MovieListViewControllerProtocol: AnyObject {
    
}

class MovieListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: MovieListInteractorProtocol!
    
    var router: MovieListRouterProtocol!
    
}

extension MovieListViewController: MovieListViewControllerProtocol {
    
}
