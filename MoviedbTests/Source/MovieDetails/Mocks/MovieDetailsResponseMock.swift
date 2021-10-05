//
//  MovieDetailsResponseMock.swift
//  MoviedbTests
//
//  Created by Hellen on 05/10/21.
//

@testable import Moviedb

struct MovieDetailsResponseMock {
    
    static func build() -> MovieDetailsResponse {
        let genres = [Genre(id: 1, name: "Horror")]
        
        let cast = [Cast(name: "Elizabeth Olsen", character: "Wanda Maximoff", profilePath: nil)]
        
        let credits = Credits(cast: cast)
        
        let results = MovieListResponseMock.build().results
        
        let recommendation = RecommendationResponse(page: 1, results: results)
        
        return MovieDetailsResponse(
            runtime: 120,
            genres: genres,
            credits: credits,
            recommendations: recommendation)
    }
}
