//
//  MovieHomeScreenRouter.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieHomeScreen Module Router (aka: Wireframe)
class MovieHomeScreenRouter: MovieHomeScreenRouterProtocol {
    func showMovieDetails(with movie: Movie, from view: UIViewController) {
        
        
    }
    
    func showNowPlayingSeeAllMovies(from view: UIViewController) {
        
        
    }
    
    // Creating Home Screen module
    class func homeScreenModuleCreator(homeScreenRef: MovieHomeScreenView) {
        let presenter: MovieHomeScreenOutputInteractorProtocol & MovieHomeScreenPresenterProtocol =
            MovieHomeScreenPresenter()
        
        homeScreenRef.presenter = presenter
        homeScreenRef.presenter?.wireframe = MovieHomeScreenRouter()
        homeScreenRef.presenter?.interactor = MovieHomeScreenInteractor()
        homeScreenRef.presenter?.interactor?.presenter = presenter
    }
    
        
}
