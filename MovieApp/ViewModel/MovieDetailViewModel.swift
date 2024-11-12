//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 12/11/24.
//

import Foundation

protocol MovieDetailViewModelDelegate: AnyObject {
    func loadingMovie()
    func didFetchMovie(movie: MovieDetailResponse)
    func didFailWithError(error: Error)
}

class MovieDetailViewModel {
    private var apiService = APIServices()
    
    weak var delegate: MovieDetailViewModelDelegate?
    
    func fetchMovie(id: Int) {
        delegate?.loadingMovie()
        apiService.fetchMovieDetail(id: id) { [weak self] result in
            switch result {
                case .success(let movieDetailResponse):
                    DispatchQueue.main.async {
                        self?.delegate?.didFetchMovie(movie: movieDetailResponse)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.delegate?.didFailWithError(error: error)
                    }
            }
        }
    }
   
}
