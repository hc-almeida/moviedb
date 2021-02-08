//
//  ViewController.swift
//  Moviedb
//
//  Created by Hellen Caroline on 26/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = MovieService()
        service.fetchMovieList(
            success: { movies in
                print(movies)
            },
            failure: {
                
            })
    }
}

