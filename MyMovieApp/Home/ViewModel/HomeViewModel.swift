//
//  HomeViewModel.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

import Foundation

class HomeViewModel {
    
    private var movies: Movies?
    
    private weak var view: HomeViewController?
    private let apiConnect = ApiConnection()
    
    func bind(view: HomeViewController) {
        self.view = view
    }
    
    func getMovieList() -> [MovieList]? {
        let group = DispatchGroup()
        group.enter()
        self.apiConnect.getMoviesList { result in
            self.movies = result
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {[weak self] in
            
        }
        return movies?.movies
    }
    
}
 
    

