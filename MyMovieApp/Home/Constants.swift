//
//  Constants.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

import Foundation

struct Constant {
    static let apiKey = "api_key=c3d2901fcbed08e758904426f64e154e"
    static let mainURL = "https://api.themoviedb.org/"
    static let mainImageURL = "https://image.tmdb.org/t/p/w500"
    
    // Endpoints
    static let upComingList = "3/movie/upcoming"
    static let page = "?page=\(pageInt)&"
    static var pageInt = 1
    
}

