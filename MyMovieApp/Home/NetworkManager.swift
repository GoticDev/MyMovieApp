//
//  NetworkManager.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

import Foundation
import UIKit

class ApiConnection {
    
    static let shared = ApiConnection()
    
    func getMoviesList (completion: @escaping (_ result: Movies) -> Void) {
    
        let url = Constant.mainURL + Constant.upComingList + Constant.page + Constant.apiKey
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode(Movies.self, from: data)
                    completion(movies)
                } catch let error {
                    print("Ha ocurrido un error: \(error.localizedDescription)")
                }
                
            } else if response.statusCode == 401 {
                print("error 401")
            }
                
        }.resume()
        
        
    }
    
}
