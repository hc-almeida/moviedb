//
//  MovieListViewDelegate.swift
//  Moviedb
//
//  Created by Hellen on 27/08/21.
//

import Foundation

protocol MovieListViewDelegate: AnyObject {
    
    func fetchMovieListNextPage()
    
    func selectMovie(at index: Int)
}
