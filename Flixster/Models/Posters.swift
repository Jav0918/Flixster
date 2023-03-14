//
//  Posters.swift
//  Flixster
//
//  Created by Jonathan Velez on 3/13/23.
//

import Foundation

struct postersSearchResponse: Decodable {
    
    let results: [Posters]
    
}

struct Posters: Decodable {
    
    let original_title: String
    let overview: String
    let poster_path: URL
    let backdrop_path: URL
    let vote_average: Double
    let vote_count: Int
    let popularity: Float
    let id: Int
    
}
