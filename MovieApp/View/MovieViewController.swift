//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 5/11/24.
//

import UIKit

class MovieViewController: UIViewController{
    
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    private var movieDetailViewModel = MovieDetailViewModel()
    
    var movieID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    private func initUI(){
        
    }
    
}

extension MovieViewController: MovieDetailViewModelDelegate{
    func loadingMovie() {
        print("loading")
    }
    
    func didFetchMovie(movie: MovieDetailResponse) {
        print("success")
    }
    
    func didFailWithError(error: any Error) {
        print("fail")
    }
    
    
}
