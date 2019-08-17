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
    func getPlayingNowMovies() {
        
    }
    
    var presenter: MovieHomeScreenOutputInteractorProtocol?
    
    func getNowPlayingMovies() {
        // Fetch now playing from server
        
        //Then retriece data using delegate pattern:
        //presenter?.nowPlayingMoviesDidFetch(movies: [Movie])
    }
    
    
   
}
