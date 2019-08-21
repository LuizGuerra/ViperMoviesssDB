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
  
    func showMovieDetails(with movie: GlobalMovie?, from view: UIViewController) {
        let movieDetailsStoryboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        
        let movieDetailsVC = movieDetailsStoryboard.instantiateViewController(withIdentifier: "movieDetailsController") as! MovieDetailsView
        
        MovieDetailsRouter.movieDetailsModuleCreator(movieDetailsRef: movieDetailsVC,and: movie)
        
        view.navigationController?.pushViewController(movieDetailsVC, animated: false)
        
    }
    
    func showNowPlayingSeeAllMovies(from view: UIViewController,with movie: [GlobalMovie]?) {
        
        print("showNowPlayingSeeAllMovies")
        
        let nowPlayingStoryBoard = UIStoryboard(name: "NowPlaying", bundle: nil)
        let nowPlayingVC = nowPlayingStoryBoard.instantiateViewController(withIdentifier: "nowPlayingViewController") as! NowPlayingView
        
        NowPlayingRouter.homeScreenModuleCreator(playingNowRef: nowPlayingVC, and: movie)
        
        view.navigationController?.pushViewController(nowPlayingVC, animated: false)
        
    }
    
    // Creating Home Screen module
    class func homeScreenModuleCreator(homeScreenRef: MovieHomeScreenView) {
        let presenter: MovieHomeScreenOutputInteractorProtocol & MovieHomeScreenPresenterProtocol =
            MovieHomeScreenPresenter()
        
        homeScreenRef.presenter = presenter
        homeScreenRef.presenter?.wireframe = MovieHomeScreenRouter()
        homeScreenRef.presenter?.view = homeScreenRef
        homeScreenRef.presenter?.interactor = MovieHomeScreenInteractor()
        homeScreenRef.presenter?.interactor?.presenter = presenter
    }
    
        
}
