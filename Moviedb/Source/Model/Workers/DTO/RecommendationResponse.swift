//
//  RecommendationResponse.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import Foundation

struct RecommendationResponse: Decodable {
    
    let page: Int
    
    let results: [Movie]
}
