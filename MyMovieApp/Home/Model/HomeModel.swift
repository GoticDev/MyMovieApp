//
//  HomeModel.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let page: Int
    let movies: [MovieList]
    var totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct MovieList: Codable {
    let overview: String
    let popularity: Double
    let posterPath:String?
    let releaseDate, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

