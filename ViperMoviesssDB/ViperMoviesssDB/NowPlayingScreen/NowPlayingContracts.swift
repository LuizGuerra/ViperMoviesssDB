//
//  NowPlayingContracts.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 20/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// NowPlaying Module View Protocol
protocol NowPlayingViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type NowPlayingEntity
}

//MARK: Interactor -
/// NowPlaying Module Interactor Protocol
protocol NowPlayingInteractorProtocol {
    // Fetch Object from Data Layer
}

//MARK: Presenter -
/// NowPlaying Module Presenter Protocol
protocol NowPlayingPresenterProtocol {
   
}

//MARK: Router (aka: Wireframe) -
/// NowPlaying Module Router Protocol
protocol NowPlayingRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: NowPlayingEntity, parentViewController viewController: UIViewController)
}
