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
    func showNowPlayingMovies(with movies: [GlobalMovie]?)
    func showPopularMovies(with movies: [GlobalMovie]?)
 
}

//MARK: - Interactor

protocol MovieHomeScreenInputInteractorProtocol: class {
    var presenter: MovieHomeScreenOutputInteractorProtocol? {get set}
    
    //Presenter -> Interactor
    func getPlayingNowMovies()
    func getPopularMovies()
    
}

protocol MovieHomeScreenOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func popularMoviesDidFetch(movies:[GlobalMovie]?)
    func nowPlayingMoviesDidFetch(movies:[GlobalMovie]?)
}


//MARK: - Presenter

protocol MovieHomeScreenPresenterProtocol {
    // View -> Presenter
    
    var interactor: MovieHomeScreenInputInteractorProtocol? {get set}
    var view: MovieHomeScreenViewProtocol? {get set}
    var wireframe: MovieHomeScreenRouterProtocol? {get set}
    
    func viewDidLoad()
    
    func showMovieDetails(with movie: GlobalMovie?, from view: UIViewController)
    func showNowPlayingSeeAllMovies(from view:UIViewController,with movie: [GlobalMovie]?)

    
}

//MARK: - Router (aka: Wireframe)

protocol MovieHomeScreenRouterProtocol {
    
    //Presenter -> Wireframe
    func showMovieDetails(with movie:GlobalMovie?,from view:UIViewController)
    func showNowPlayingSeeAllMovies(from view:UIViewController,with movie: [GlobalMovie]?)
    
}
