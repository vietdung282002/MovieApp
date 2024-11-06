//
//  Movie.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 5/11/24.
//

import Foundation

struct Movie: Hashable{
    let id : Int
    let title : String
//    let genreIds : [Int]?
//    let genres : [MovieGenre]?
    let genre: String
    let posterPath : String
    let overview : String
    let releaseDate : String
    let voteAverage : Double
    let backdropPath : String
    let duration : Int
}

#if DEBUG
extension Movie {
    static var sampleData = [
        Movie(id:1,title: "Spiderman1",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139),
        Movie(id:2,title: "Spiderman2",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139),
        Movie(id:3,title: "Spiderman3",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139),
        Movie(id:4,title: "Spiderman4",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139),
        Movie(id:5,title: "Spiderman5",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139),
        Movie(id:6,title: "Spiderman6",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139),
        Movie(id:7,title: "Spiderman7",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139),
        Movie(id:8,title: "Spiderman8",genre: "Action", posterPath: "spiderman",overview: "",  releaseDate: "2019", voteAverage: 9.5,backdropPath:"", duration: 139)
    ]
}
#endif
