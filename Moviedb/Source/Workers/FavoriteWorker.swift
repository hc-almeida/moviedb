//
//  FavoriteWorker.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import UIKit
import RealmSwift

protocol FavoriteWorkerProtocol {
    
    func get() -> [MovieObject]
    
    @discardableResult
    func save(_ customer: Movie) -> Result<MovieObject, MovieError>
}

class FavoriteWorker: FavoriteWorkerProtocol {
    
    let realm: Realm = {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError(error.localizedDescription)
        }
    }()
    
    func get() -> [MovieObject] {
        let resultMovie = realm.objects(MovieObject.self)
        
        var movies = [MovieObject]()
        for movie in resultMovie {
            movies.append(movie)
        }
        
        return movies
    }
    
    func save(_ movie: Movie) -> Result<MovieObject, MovieError> {
        let newMovie = MovieObject(movie)
        
        do {
            try realm.write {
                realm.add(newMovie, update: .all)
            }
            return .success(newMovie)
        } catch {
            print(error.localizedDescription)
            return .failure(.databaseError) // Corrigir erros
        }
    }
}
