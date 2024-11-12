//
//  ViewController.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 5/11/24.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieListController: UICollectionViewController{
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, MovieListModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, MovieListModel>
    
    private var viewModel: MovieListViewModel!
    private var page:Int = 1
    private var isLoadingMoreMovies = false
    private var movie : [MovieListModel] = []
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = MovieListViewModel()
        viewModel.delegate = self
        viewModel.fetchMoviesList(page: 1)
        
        let nib = UINib(nibName: "MovieCell", bundle: .main)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        setupCell()
        
        navigationItem.title = NSLocalizedString("Movies", comment: "Movie view controller title")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        collectionView.dataSource = dataSource
        updateSnapshot()
        
    
    }
    
    private func setupCell(){
        let screenWidth = UIScreen.main.bounds.width - 10
        let screenHeight = UIScreen.main.bounds.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight*120/812)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 20
        
        collectionView!.collectionViewLayout = layout
    }
    
    private func configureDataSource() -> DataSource{

        let dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
            cell.titleLabel.text = item.title
            cell.rateLabel.text = String(item.voteAverage)
            cell.releaseLabel.text = String(item.releaseDate)
            if item.duration == nil {
                cell.durationLabel.text = ""
            }else{
                cell.durationLabel.text = String(item.duration!)
            }

            let imageUrl = "https://image.tmdb.org/t/p/w600_and_h900_bestv2" + item.posterPath
            let url = URL(string: imageUrl)
            cell.posterImage.image = UIImage(named: item.posterPath)
            cell.posterImage.af.setImage(withURL: url!)
            cell.posterImage.contentMode = .scaleAspectFill
            cell.posterImage.layer.cornerRadius = 16
            cell.posterImage.clipsToBounds = true
            return cell
        }

        return dataSource
    }
    
    private func updateSnapshot(animatingChange: Bool = false) {

        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(movie)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = movie[indexPath.item].id
        pushDetailViewForMovie(movie: id)
        return false
    }
    
    private func pushDetailViewForMovie(movie id: Int) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "movieDetailController") as! MovieViewController
        storyboard.movieID = id
        navigationController?.pushViewController(storyboard, animated: true)
            
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height

        if contentOffsetY > contentHeight - scrollViewHeight * 1.5 && !isLoadingMoreMovies {
            isLoadingMoreMovies = true
            viewModel.fetchMoviesList(page: page + 1)
        }
    }
}

extension MovieListController:  MovieListViewModelDelegate{
    func didFetchMovies(movies: [MovieListModel])  {
        for movie in movies{
            self.movie.append(movie)
        }
        updateSnapshot()
        page += 1
        isLoadingMoreMovies = false
    }
    
    func didFailWithError(error: any Error) {
        isLoadingMoreMovies = false
    }
    
    func loadingMovieList() {
        
    }
}


