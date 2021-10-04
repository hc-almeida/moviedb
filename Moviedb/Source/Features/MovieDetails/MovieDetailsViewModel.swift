//
//  MovieDetailsViewModel.swift
//  Moviedb
//
//  Created by Hellen on 04/10/21.
//

import Foundation

struct MovieDetailsViewModel {
    let movieDetails: [DetailsViewModel]
}

struct DetailsViewModel {
    
    let genres: String
    
    let duration: String
    
    let overview: String
    
    let releaseDate: String
    
    let note: String
}
