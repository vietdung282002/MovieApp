//
//  APIService.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 6/11/24.
//

import Foundation
import Alamofire

class APIServices {
    private let baseURL = "https://api.themoviedb.org/3/"
    private let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNzg0NjVjYTMxYWY3N2RkYzQ4ZGM1ZTUyNWQ2MjliYSIsIm5iZiI6MTczMDg4OTY5NS4zODkyODkxLCJzdWIiOiI2NWZkNjM2NDA5MjlmNjAxNjQ5OWMyMDMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0._J3hjLyPNDPSnkE3MPb7MqygxoMc0x-IheMGvcWjkMY"
    private let apiKey = "a78465ca31af77ddc48dc5e525d629ba"
    
    func fetchMoviesList(page: Int, completion: @escaping (Result<MovieListResponse, Error>) -> Void) {
        let parameters: [String: Any] = [
                    "api_key": apiKey,
                    "page": String(page),
                    "include_adult": false,
                    "include_video": false,
                    "language": "en-US",
                    "sort_by": "popularity.desc"
                ]
        
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        let url = baseURL + "discover/movie"
        

        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: MovieListResponse.self) { response in
                switch response.result {
                case .success(let movieResponse):
                    completion(.success(movieResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchMovieDetail(id: Int, completion: @escaping (Result<MovieDetailResponse, Error>) -> Void) {
        let url = baseURL + "movie/\(id)"
        
        let parameters: Parameters = [
            "language": "en-US"
        ]
        
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: MovieDetailResponse.self) { response in
                switch response.result {
                case .success(let movieDetail):
                    completion(.success(movieDetail))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
