//
//  Film.swift
//  movies
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import Foundation

struct Film: Decodable {
    let id: Int
    let adult: Bool
    let title: String
    let popularity: Float
    let overview: String
    let originalTitle: String
    let poster: String
    let backdrop: String?
    let releaseDate: String
    let genres: [Int]
    let voteAverage: Float
    let voteCount: Int
    let originalLanguage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case title
        case popularity
        case overview
        case originalTitle = "original_title"
        case poster = "poster_path"
        case backdrop = "backdrop_path"
        case releaseDate = "release_date"
        case genres = "genre_ids"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originalLanguage = "original_language"
    }
}
