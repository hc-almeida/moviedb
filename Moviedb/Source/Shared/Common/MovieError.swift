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

extension MovieError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Desculpe, ocorreu um erro ao conectar aos servidores."
        case .decodeError:
            return "Desculpe, algo deu errado."
        case .databaseError:
            return "Desculpe, ocorreu um erro com o banco de dados."
        }
    }
}
