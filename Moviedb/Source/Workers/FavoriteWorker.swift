//
//  FavoriteWorker.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import UIKit
import RealmSwift

protocol FavoriteWorkerProtocol {
    
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
    
    func get() -> Result<Results<MovieObject>?, MovieError>  {
        do {
            let realm = try Realm()
            let resultMovie = realm.objects(MovieObject.self)
            return .success(resultMovie)
        } catch {
            return .failure(.decodeError) // Corrigir erros
        }
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
