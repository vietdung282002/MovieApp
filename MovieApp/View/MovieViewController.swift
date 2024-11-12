//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 5/11/24.
//

import UIKit
import Alamofire
import AlamofireImage
import MBProgressHUD

class MovieViewController: UIViewController{
    
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteAverage: UIButton!
    
    private var movieDetailViewModel = MovieDetailViewModel()
    
    var movieID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDetailViewModel.delegate = self
        
        if #available(iOS 16, *) {
            navigationItem.style = .navigator
        }
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationItem.title = NSLocalizedString("Detail", comment: "Detail view controller title")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "top-bar-right"))
        navigationController?.navigationBar.tintColor = UIColor.white
        
        movieDetailViewModel.fetchMovie(id: movieID)
        
        // Do any additional setup after loading the view.
    }
    
    private func initUI(movie: MovieDetailResponse){
        voteAverage.layer.cornerRadius = 10
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 16
        posterImage.clipsToBounds = true
        if movie.backdropPath != nil{
            let backdropPath = "https://image.tmdb.org/t/p/w533_and_h300_bestv2" + movie.backdropPath!
            let backdropUrl = URL(string: backdropPath)
            backdropImage.af.setImage(withURL: backdropUrl!)
        }
        
        let posterPath = "https://image.tmdb.org/t/p/w600_and_h900_bestv2" + movie.posterPath
        let posterUrl = URL(string: posterPath)
        
        posterImage.af.setImage(withURL: posterUrl!)
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.formattedReleaseDate
        genreLabel.text = movie.formattedGenres
        durationLabel.text = movie.formattedDuration
        overviewLabel.text = movie.overview
        voteAverage.setTitle(movie.formattedVoteAverage, for: .normal)
    }
    
}

extension MovieViewController: MovieDetailViewModelDelegate{
    func loadingMovie() {
        print("loading")
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func didFetchMovie(movie: MovieDetailResponse) {
        print("success")
        initUI(movie: movie)
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func didFailWithError(error: any Error) {
        print("fail")
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    
}
