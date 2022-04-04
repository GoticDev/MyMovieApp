//
//  HomeModel.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.

import Foundation

// MARK: - Movies
struct Movies: Codable {
//    let dates: Dates
    let page: Int
    let movies: [MovieList]
    var totalPages: Int
//    var totalResults: Int

    enum CodingKeys: String, CodingKey {
//        case dates
        case page
        case movies = "results"
        case totalPages = "total_pages"
//        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct MovieList: Codable {
//    let adult: Bool
//    let backdropPath: String?
//    let genreIDS: [Int]
//    let id: Int
//    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath:String?
    let releaseDate, title: String
//    let video: Bool
    let voteAverage: Double
//    let voteCount: Int

    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
//        case video
        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
    }
}

