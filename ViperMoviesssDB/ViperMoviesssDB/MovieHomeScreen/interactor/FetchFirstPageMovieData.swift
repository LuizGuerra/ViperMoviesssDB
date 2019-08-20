//
//  FetchFirstPageMovieData.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

final class FetchFirstPageMovieData: FetchAllMoviesDataProcol {
    
    static let shared:FetchFirstPageMovieData = FetchFirstPageMovieData()

    var results:[GlobalMovie]?
    
    func fetchData(completion: @escaping ([GlobalMovie]?)->Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=e7874dc70ec5827126c27e68c1c85962&language=en-US&page=1") else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let jsonAsString = String(data: data, encoding: .utf8)?.data(using: .utf8) else { return }
                
                do {
                    let pr = try JSONDecoder().decode(AllResults.self, from: jsonAsString)
                    self.results = [GlobalMovie]()
                    
                    let downloadAlbumImagesGroup = DispatchGroup()
                    
                    
                    for result in pr.results{
                        
                        downloadAlbumImagesGroup.enter()
                        
                        FetchMovieData.shared.fetchImage(posterPath: result.posterPath, completion: { imageData in
               
                            let movie = GlobalMovie(title: result.title,
                                                    overview: result.overview,
                                                    voteAverage: result.voteAverage,
                                                    albumImage: imageData)
                            self.results?.append(movie)
                            
                            downloadAlbumImagesGroup.leave()
                        })

                    }
                    
                    downloadAlbumImagesGroup.notify(queue: DispatchQueue.main){
                        print("Loaded all album images ")
                        completion(self.results)
                    }

                } catch {
                    completion(nil)
                    print("error")
                }
            }
            }.resume()
        
    }
    
    
    
}

extension FetchFirstPageMovieData: FetchImageDataProtocol {
    func fetchImage(posterPath: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") else { return completion(Data()) }
        
        URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let imageData = data else { return }
            completion(imageData)
   
    }
    }
    
}
