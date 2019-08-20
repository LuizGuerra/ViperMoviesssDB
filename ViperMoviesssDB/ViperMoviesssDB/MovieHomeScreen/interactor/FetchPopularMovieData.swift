//
//  FetchMovieData.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

final class FetchPopularMovieData: FetchPopularMooviesProtocol {
    
    static let shared:FetchPopularMovieData = FetchPopularMovieData()
    
    var results:[GlobalMovie]?
    
    func fetchData(completion: @escaping ([GlobalMovie]?)->Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e7874dc70ec5827126c27e68c1c85962&language=en-US&page=1") else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let jsonAsString = String(data: data, encoding: .utf8)?.data(using: .utf8) else { return }
                do {

                    let pr = try JSONDecoder().decode(PopularMoviesResult.self, from: jsonAsString)
                    
//                    self.results = [GlobalMovie]()
//                    for result in pr.results{
//                        FetchMovieData.shared.fetchImage(posterPath: result.posterPath){imageData in
//                            print(imageData.debugDescription)
//                            let movie = GlobalMovie(title: result.title,
//                                                    overview: result.overview,
//                                                    voteAverage: result.voteAverage,
//                                                    albumImage: imageData)
//
//                            self.results?.append(movie)
//                        }
//                    }

                    completion(nil)
                } catch {
                    print(error.localizedDescription)
                    print("error3")
                    completion(nil)
                }
            }
            }.resume()
        
    }
    
}

extension FetchPopularMovieData: FetchImageDataProtocol {
    func fetchImage(posterPath: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") else { return completion(Data())}
        
        URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let imageData = data else { return }
            completion(imageData)

    }
    
    
    }
}
