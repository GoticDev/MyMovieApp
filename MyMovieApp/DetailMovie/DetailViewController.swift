//
//  DetailViewController.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 4/04/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overView: UILabel!
    
    var detailTitle = ""
    var detailPoster = ""
    var detailVoteAverage = ""
    var detailReleaseDate = ""
    var detailOverView = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleMovie.text = detailTitle
        voteAverage.text = detailVoteAverage
        releaseDate.text = detailReleaseDate
        overView.text = detailOverView
        
        if let imageURL = URL(string: detailPoster) {
            poster.sd_setImage(with: imageURL)
        } else {
            poster.image = UIImage(named: "cine_image")
            poster.alpha = 0.5
        }

    }



}
