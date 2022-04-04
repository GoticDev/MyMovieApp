//
//  HomeViewController.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    private let homeViewModel = HomeViewModel()
    var moviesList: [MovieList] = [MovieList]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Movie App"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        homeViewModel.bind(view: self)
        setTableView()
        getMovieList()
        print(moviesList.count)
    }
    
    
    func getMovieList() {
        let group = DispatchGroup()
        group.enter()
        ApiConnection.shared.getMoviesList { result in
            self.moviesList = result.movies
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {[weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        cell.title.text = moviesList[indexPath.row].title
        
        let imageURL = Constant.mainImageURL + moviesList[indexPath.row].posterPath
        if let imageURL = URL(string: imageURL){
            cell.poster.sd_setImage(with: imageURL)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVC.detailTitle = moviesList[indexPath.row].title
        detailVC.detailOverView = moviesList[indexPath.row].overview
        detailVC.detailVoteAverage = String(moviesList[indexPath.row].voteAverage)
        detailVC.detailReleaseDate = String(moviesList[indexPath.row].releaseDate)
        
        let imageURL = Constant.mainImageURL + moviesList[indexPath.row].posterPath
        detailVC.detailPoster = imageURL
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
