//
//  FetchMovieData.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

final class FetchMovieData: FetchMovieDataProtocol {
    
    static let shared = FetchMovieData()
    
    func fetchMovieData(movieId: String) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=e7874dc70ec5827126c27e68c1c85962&language=en-US") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let jsonAsString = String(data: data, encoding: .utf8)?.data(using: .utf8) else { return }
                do {
                    let pr = try JSONDecoder().decode(Movie.self, from: jsonAsString)
                    print(pr)
                } catch {
                    print(error.localizedDescription)
                }
            }
            }.resume()
        
    }
    
}

extension FetchMovieData: FetchImageDataProtocol {
    
//  Can return empty data, if returns empty data, set "could not load image"
    func fetchImage(posterPath: String,completion: @escaping (Data)->Void){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") else { return completion(Data())}
        
        URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let imageData = data else { return }
            print("Fetching data")
            print(imageData)
            completion(imageData)
           
            }.resume()
       
    }
}
