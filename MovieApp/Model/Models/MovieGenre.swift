//
//  MovieGenre.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 6/11/24.
//

import Foundation

struct MovieGenre : Codable,Hashable {
    let id : Int
    let genreName : String
    
    private enum CodingKeys : String, CodingKey {
        case id
        case genreName = "name"
    }
}
