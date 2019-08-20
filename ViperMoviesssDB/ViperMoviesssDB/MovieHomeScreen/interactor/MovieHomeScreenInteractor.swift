//
//  MovieHomeScreenInteractor.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieHomeScreen Module Interactor
class MovieHomeScreenInteractor:  MovieHomeScreenInputInteractorProtocol{
    
    var presenter: MovieHomeScreenOutputInteractorProtocol?
    
    func getPlayingNowMovies() {
        FetchFirstPageMovieData.shared.fetchData(completion: { results in
            self.presenter?.nowPlayingMoviesDidFetch(movies: results)
        })
    }
    
    func getPopularMovies() {
        FetchPopularMovieData.shared.fetchData { (result) in
            self.presenter?.popularMoviesDidFetch(movies: result)
        }
    }
    
    func getMovieAlbumImages(with posterPath: [String]) {
        
    }

}
