//
//  MovieDetails.swift
//  Moviedb
//
//  Created by Hellen Caroline on 02/02/21.
//

import Foundation

struct Details {
    
    let genres: String
    
    let duration: String
    
    let cast: [Cast]
    
    let recommendations: [Movie]
    
    init(_ response: MovieDetailsResponse) {
        self.duration = response.runtime.durationFormat ?? ""
        
        self.cast = Array(response.credits.cast)
        
        self.genres = response.genres
            .prefix(2)
            .map({ $0.name })
            .joined(separator: " - ")
        
        self.recommendations = response.recommendations.results
    }
}
