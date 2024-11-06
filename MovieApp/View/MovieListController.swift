//
//  ViewController.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 5/11/24.
//

import UIKit

class MovieListController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Movie>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Movie>
    
    let movie = Movie.sampleData
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "MovieCell", bundle: .main)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        let screenWidth = UIScreen.main.bounds.width - 10
        let screenHeight = UIScreen.main.bounds.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight*120/812)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 20
        
        collectionView!.collectionViewLayout = layout
        
        navigationItem.title = NSLocalizedString("Movies", comment: "Movie view controller title")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        collectionView.dataSource = dataSource
        updateSnapshot()
    }
    
    func configureDataSource() -> DataSource{

        let dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
            cell.titleLabel.text = item.title
            cell.rateLabel.text = String(item.voteAverage)
            cell.releaseLabel.text = String(item.releaseDate)
            cell.durationLabel.text = String(item.duration)
            
            cell.posterImage.image = UIImage(named: item.posterPath)
            cell.posterImage.contentMode = .scaleAspectFill
            cell.posterImage.layer.cornerRadius = 16
            cell.posterImage.clipsToBounds = true
            return cell
        }

        return dataSource
    }
    
    func updateSnapshot(animatingChange: Bool = false) {

        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(movie)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        pushDetailViewForMovie()
        return false
    }
        
    func pushDetailViewForMovie() {
//           let reminder = reminder(withId: id)
//           let viewController = ReminderViewController(reminder: reminder) { [weak self] reminder in
//                       self?.updateReminder(reminder)
//                       self?.updateSnapshot(reloading: [reminder.id])
//                   }
//           navigationController?.pushViewController(viewController, animated: true)
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "movieDetailController") as! MovieViewController
        navigationController?.pushViewController(storyboard, animated: true)
            
    }
}


