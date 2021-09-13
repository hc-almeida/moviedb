//
//  MovieDetailsViewController.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import UIKit

protocol MovieDetailsViewControllerProtocol: AnyObject {
    
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

        // Do any additional setup after loading the view.
    }


}

extension MovieDetailsViewController: MovieDetailsViewControllerProtocol {
    
}
