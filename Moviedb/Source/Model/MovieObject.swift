//
//  MovieObject.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import RealmSwift

class MovieObject: Object {
    
    @objc dynamic var identifier = UUID().uuidString
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var posterPath: String?
    @objc dynamic var backdropPath: String?
    
    convenience init(_ movie: Movie) {
        self.init()
        self.id = movie.id
        self.title = movie.title
        self.voteAverage = movie.voteAverage
        self.releaseDate = movie.releaseDate
        self.overview = movie.overview
        self.posterPath = movie.posterPath
        self.backdropPath = movie.backdropPath
    }
    
    override static func primaryKey() -> String? {
           return "identifier"
       }
    
}
