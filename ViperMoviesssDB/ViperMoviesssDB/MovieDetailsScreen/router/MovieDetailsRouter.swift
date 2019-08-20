//
//  MovieDetailsRouter.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieDetails Module Router (aka: Wireframe)
class MovieDetailsRouter: MovieDetailsRouterProtocol {
    
    // Creating Home Screen module
    class func movieDetailsModuleCreator(movieDetailsRef: MovieDetailsView, and movie: Result?) {
        let presenter:MovieDetailsPresenterProtocol = MovieDetailsPresenter()
        
        
        movieDetailsRef.presenter = presenter
        movieDetailsRef.presenter?.movie = movie
        movieDetailsRef.presenter?.wireframe = MovieDetailsRouter()
        movieDetailsRef.presenter?.view = movieDetailsRef
        movieDetailsRef.presenter?.interactor = MovieDetailsInteractor()
        movieDetailsRef.presenter?.interactor?.presenter = presenter
        
    }
        
}
