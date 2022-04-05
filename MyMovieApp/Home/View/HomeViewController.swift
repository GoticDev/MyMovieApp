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
    var moviesList: [MovieList] = []
    var currentPage = 1
    
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
        self.homeViewModel.getMovieList(currentPage: currentPage)
        {  [weak self] list in
            self?.moviesList = list
            self?.tableView.reloadData()
            self?.currentPage += 1
            print("currentPage", self?.currentPage)
        } failure: { error in
            switch error {
            case .noloadlist:
                print("noloadlist")
                let alert = UIAlertController(title: "Algo salió mal!", message: "Vuelve a intentarlo mas tarde.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            case .nocastdata:
                print("nocastdata")
            case .nomoredata:
                print("nomoredata")
                let alert = UIAlertController(title: "Ups!", message: "No hay mas peliculas para mostrar.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
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
        
        let posterP = moviesList[indexPath.row].posterPath ?? ""
        let imageURL = Constant.mainImageURL + posterP
        if let imageURL = URL(string: imageURL), posterP != "" {
            cell.poster.sd_setImage(with: imageURL)
        } else {
            cell.poster.image = UIImage(named: "cine_image")
            cell.poster.alpha = 0.5
        }
        
        if indexPath.row == moviesList.count - 1 {
            getMovieList()
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
        
        let posterP = moviesList[indexPath.row].posterPath ?? ""
        if posterP != "" {
            let imageURL = Constant.mainImageURL + posterP
            detailVC.detailPoster = imageURL
        }
        
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
