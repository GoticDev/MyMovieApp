//
//  NetworkManager.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

import Foundation
import UIKit

enum ErrorMovies: Error {
    
    case noloadlist
    case nocastdata
    case nomoredata
}

class ApiConnection {
    
    static let shared = ApiConnection()
    
    func getMoviesList (page: Int,
                        completion: @escaping (_ result: Movies,
                                               _ totalPages : Int) -> Void,
                        failure: @escaping (ErrorMovies) -> Void) {
        let pageInt = String(page)
        let page = "?page=\(pageInt)&"
        let url = Constant.mainURL + Constant.upComingList + page + Constant.apiKey
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    guard let jsonString = String(data: data, encoding: .utf8)  else {
                        return
                    }
                    let movies = try decoder.decode(Movies.self, from: data)
                    completion(movies,
                               movies.totalPages)
                } catch {
                    failure(.nocastdata)
                }
                
            } else if response.statusCode == 401 {
                failure(.noloadlist)
            }
                
        }.resume()
        
        
    }
    
}
