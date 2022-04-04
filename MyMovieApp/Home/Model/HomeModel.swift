//
//  HomeModel.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

//import Foundation
//
//struct Movie: Codable {
//    let page: Int
//    let movies: [MoviesList]
//    let dates: Date
//    let totalPages: Int
//    let totalResults: Int
//
//    enum MovieKeys: String, CodingKey {
//        case page, dates
//        case movies = "results"
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//struct MoviesList: Codable {
//    let title: String
//    let poster: String
//    let overview: String
//    let voteAverage: Int
//    let releaseDate: String
//
//    enum MoviesListKeys: String, CodingKey {
//        case title = "original_title"
//        case overview
//        case poster = "poster_path"
//        case voteAverage = "vote_average"
//        case releaseDate = "release_date"
//    }
//}
//
//struct Date: Codable {
//    let maximum: String
//    let minimum: String
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Movies: Codable {
    let dates: Dates
    let page: Int
    let movies: [MovieList]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct MovieList: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case fr = "fr"
    case ja = "ja"
}
