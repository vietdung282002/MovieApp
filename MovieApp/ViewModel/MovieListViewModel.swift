//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 6/11/24.
//

import Foundation

protocol MovieListViewModelDelegate: AnyObject {
    func loadingMovieList()
    func didFetchMovies(movies: [MovieListModel])
    func didFailWithError(error: Error)
}

class MovieListViewModel {
    
    weak var delegate: MovieListViewModelDelegate?
    
    private var apiService = APIServices()
    
    func fetchMoviesList(page: Int) {
        delegate?.loadingMovieList()
        apiService.fetchMoviesList(page: page) { [weak self] result in
            switch result {
                case .success(let movieResponse):
                    DispatchQueue.main.async {
                        self?.delegate?.didFetchMovies(movies: movieResponse.results)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.delegate?.didFailWithError(error: error)
                    }
                }
        }
    }
   
}
