//
//  MovieDbAPI.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

class MovieDbAPI: MovieDbApiProtocol{
    
    private let API_KEY = "d3b1ab3fe7b2706e74832090ae881f18"
    
    lazy private var nowPlayingURL = {
        return "https://api.themoviedb.org/3/movie/now_playing?api_key=\(self.API_KEY)"
    }
    
    
    func fetchNowPlayingMovies(completion: @escaping ([Movie]?) -> Void) {
        
        guard let nowPlayingURL = URL(string: self.nowPlayingURL()) else {
            return
        }
                
        let request = URLRequest(url: nowPlayingURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print(error)
                return
            }
            
            // Parse Json
            
            if let data = data{
                let movies = self.parseJsonData(jsonData: data)
                completion(movies)
            }
        }
        task.resume()
  
    }
    
    func fetchAlbumImage(posterPath: String, completion: @escaping (Album) -> Void) {
        
    }
    
    private func parseJsonData(jsonData:Data) -> [Movie]?{
        
        do {
            
            let decoder = JSONDecoder()
            
            let nowPlayingMoviesResult = try decoder.decode(NowPlayingMoviesResult.self, from: jsonData)
            
            return nowPlayingMoviesResult.movies
            
        }catch{
            print(error)
            return nil
        }
    }
    
}
