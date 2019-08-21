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
        interactor?.getPopularMovies()
    }
    
    func showMovieDetails(with movie: GlobalMovie?, from view: UIViewController) {
        wireframe?.showMovieDetails(with: movie, from: view)
    }
    
    func showNowPlayingSeeAllMovies(from view: UIViewController,with movie: [GlobalMovie]?) {
        wireframe?.showNowPlayingSeeAllMovies(from: view, with: movie)

    }
    
   
    
}

// Communication from interactor
extension MovieHomeScreenPresenter: MovieHomeScreenOutputInteractorProtocol {
    

    func popularMoviesDidFetch(movies: [GlobalMovie]?) {
        view?.showPopularMovies(with: movies)
    }
    
    func nowPlayingMoviesDidFetch(movies: [GlobalMovie]?) {
        print("nowPlayingMoviesDidFetch")
        //print(movies)
        view?.showNowPlayingMovies(with: movies)
    }
    
    
}
