//
//  Movie.swift
//  MovieDB
//
//  Created by Natia Khizanishvili on 11.11.23.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

struct MoviesResponse: Codable {
    let search: [Movie]?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
