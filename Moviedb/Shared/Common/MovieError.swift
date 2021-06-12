//
//  MovieError.swift
//  Moviedb
//
//  Created by Hellen on 12/06/21.
//

import Foundation

enum MovieError: Error {
    case networkError
    case decodeError
    case databaseError
}
