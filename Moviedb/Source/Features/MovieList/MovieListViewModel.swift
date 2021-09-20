//
//  MovieListViewModel.swift
//  Moviedb
//
//  Created by Hellen on 19/09/21.
//

import Foundation

struct MovieListViewModel {
    
    let movies: [MovieViewModel]
}

struct MovieViewModel {
    
    let name: String
    
    let imagePoster: String
    
    let imageBackdropPath: String
    
    let overview: String
    
    let releaseDate: String
    
    let note: String
}
