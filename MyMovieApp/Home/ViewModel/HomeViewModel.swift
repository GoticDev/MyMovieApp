//
//  HomeViewModel.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

import Foundation

class HomeViewModel {
    
    private var movies: Movies?
    var moviesList: [MovieList] = []
    private weak var view: HomeViewController?
    private let apiConnect = ApiConnection.shared
    private var totalPages: Int = 0
    
    func bind(view: HomeViewController) {
        self.view = view
    }
    
    func getMovieList(currentPage: Int,
                      success: @escaping ([MovieList]) -> Void,
                      failure: @escaping (ErrorMovies) -> Void) {
        
        MBHubLoading.showLoading()
        self.apiConnect.getMoviesList(page: currentPage) { [weak self] result, totalPages  in
            MBHubLoading.hideLoading()
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.moviesList += result.movies
                self.totalPages = totalPages
                if currentPage > self.totalPages {
                    failure(.nomoredata)
                }
                success(self.moviesList)
            }
        } failure:  { error in
            MBHubLoading.hideLoading()
            failure(error)
        }
        
        
    }
    
}
 
    

