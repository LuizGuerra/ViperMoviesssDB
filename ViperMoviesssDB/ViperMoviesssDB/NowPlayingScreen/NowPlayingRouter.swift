//
//  NowPlayingRouter.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 20/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// NowPlaying Module Router (aka: Wireframe)
class NowPlayingRouter: NowPlayingRouterProtocol {
    
    // Creating Home Screen module
    class func homeScreenModuleCreator(playingNowRef: NowPlayingView,and movies:[GlobalMovie]?) {
        let presenter: NowPlayingPresenterProtocol = NowPlayingPresenter()
        
        playingNowRef.presenter = presenter
        playingNowRef.presenter?.movies = movies
        playingNowRef.presenter?.wireframe = NowPlayingRouter()
        playingNowRef.presenter?.view = playingNowRef
        playingNowRef.presenter?.interactor = NowPlayingInteractor()
        playingNowRef.presenter?.interactor?.presenter = presenter
    }
        
}
