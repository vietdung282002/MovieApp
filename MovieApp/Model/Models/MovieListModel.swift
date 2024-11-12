//
//  MovieModel.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 6/11/24.
//

import Foundation

struct MovieListModel : Codable,Hashable,Equatable {
    static func == (lhs: MovieListModel, rhs: MovieListModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id : Int
    let title : String
    let genreIds : [Int]?
    let genres : [MovieGenre]?
    let posterPath : String
    let overview : String
    let releaseDate : String
    let voteAverage : Double
    let backdropPath : String?
    let duration : Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case genreIds = "genre_ids"
        case genres = "genres"
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case duration = "runtime"
    }
}
