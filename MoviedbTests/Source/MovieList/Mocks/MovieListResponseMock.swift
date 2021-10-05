//
//  MovieListResponseMock.swift
//  MoviedbTests
//
//  Created by Hellen on 05/10/21.
//

@testable import Moviedb

struct MovieListResponseMock {

    static func build(page: Int = 1) -> MovieListResponse {
        let response = [
            
            1: [Movie(id: 1, title: "Joker", voteAverage: 92.0, releaseDate: "20/02/2019", overview: "Overview", posterPath: nil, backdropPath: nil),
                        
            Movie(id: 2, title: "Parasite", voteAverage: 93.0, releaseDate: "22/11/2020", overview: "Overview", posterPath: nil, backdropPath: nil)]
        ]
        
        return MovieListResponse(
            page: page,
            totalPages: response.count,
            totalResult: response.count * 2,
            results: response[page] ?? [])
    }
}
