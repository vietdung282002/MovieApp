//
//  MovieListResponse.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 6/11/24.
//

import Foundation

struct MovieListResponse : Codable {
     let page : Int
     let results : [MovieListModel]
     let totalPage : Int
     let totalResult : Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPage = "total_pages"
        case totalResult = "total_results"
    }
}



