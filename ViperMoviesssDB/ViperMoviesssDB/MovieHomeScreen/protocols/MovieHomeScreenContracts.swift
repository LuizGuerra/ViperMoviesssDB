//
//  MovieHomeScreenContracts.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

//MARK: - View

protocol MovieHomeScreenViewProtocol: class {
    // PRESENTER -> VIEW
    func showNowPlayingMovies(with movies: [Movie]?)
    func showPopularMovies(with movies: [Movie]?)
}

//MARK: - Interactor

protocol MovieHomeScreenInputInteractorProtocol: class {
    var presenter: MovieHomeScreenOutputInteractorProtocol? {get set}
    
    //Presenter -> Interactor
    func getNowPlayingMovies()
    func getPlayingNowMovies()
}

protocol MovieHomeScreenOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func popularMoviesDidFetch(movies:[Movie])
    func nowPlayingMoviesDidFetch(movies:[Movie])
}


//MARK: - Presenter

protocol MovieHomeScreenPresenterProtocol {
    // View -> Presenter
    
    var interactor: MovieHomeScreenInputInteractorProtocol? {get set}
    var view: MovieHomeScreenViewProtocol? {get set}
    var wireframe: MovieHomeScreenRouterProtocol? {get set}
    
    func viewDidLoad()
    
    
    
}

//MARK: - Router (aka: Wireframe)

protocol MovieHomeScreenRouterProtocol {
    
    //Presenter -> Wireframe
    func showMovieDetails(with movie:Movie,from view:UIViewController)
    func showNowPlayingSeeAllMovies(from view:UIViewController)
}
