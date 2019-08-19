//
//  MovieHomeScreenPresenter.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieHomeScreen Module Presenter
class MovieHomeScreenPresenter: MovieHomeScreenPresenterProtocol{
    
    
   
    var view: MovieHomeScreenViewProtocol?
    var interactor: MovieHomeScreenInputInteractorProtocol?
    var wireframe: MovieHomeScreenRouterProtocol?
    
    
    
    func viewDidLoad() {
        print("viewDidLoad()")
        
        interactor?.getPlayingNowMovies()
    }
    
    func showMovieDetails(with movie: Movie, from view: UIViewController) {
        wireframe?.showMovieDetails(with: movie, from: view)
    }
    
    
}

// Communication from interactor
extension MovieHomeScreenPresenter: MovieHomeScreenOutputInteractorProtocol {
    
    
    func popularMoviesDidFetch(movies: [Movie]) {
        view?.showPopularMovies(with: movies)
    }
    
    func nowPlayingMoviesDidFetch(movies: [Result]?) {
        print("nowPlayingMoviesDidFetch")
        //print(movies)
        view?.showNowPlayingMovies(with: movies)
    }
    
    
}
