//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 5/11/24.
//

import Foundation

struct MovieDetailResponse :Codable{
    let title: String
    let backdropPath: String?
    let posterPath : String
    let voteAverage : Double
    let genres : [MovieGenre]?
    let releaseDate: String
    let duration: Int?
    let overview : String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case genres = "genres"
        case releaseDate = "release_date"
        case duration = "runtime"
        case overview
    }
    
    var formattedVoteAverage: String {
        return String(format: "%.1f", voteAverage)
    }
    
    var formattedReleaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    var formattedDuration: String {
        guard let duration = duration else {
            return ""
        }
        return "\(duration) Minutes"
    }
    
    var formattedGenres: String {
        guard let firstGenre = genres?.first else {
            return ""
        }
        return firstGenre.genreName
    }
}
