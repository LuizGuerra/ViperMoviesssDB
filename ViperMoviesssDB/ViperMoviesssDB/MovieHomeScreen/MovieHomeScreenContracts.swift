//
//  MovieHomeScreenContracts.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// MovieHomeScreen Module View Protocol
protocol MovieHomeScreenViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type MovieHomeScreenEntity
    func set(object: MovieHomeScreenEntity)
}

//MARK: Interactor -
/// MovieHomeScreen Module Interactor Protocol
protocol MovieHomeScreenInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: MovieHomeScreenPresenterProtocol)
}

//MARK: Presenter -
/// MovieHomeScreen Module Presenter Protocol
protocol MovieHomeScreenPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: MovieHomeScreenViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: MovieHomeScreenInteractorProtocol, didFetch object: MovieHomeScreenEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: MovieHomeScreenInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// MovieHomeScreen Module Router Protocol
protocol MovieHomeScreenRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: MovieHomeScreenEntity, parentViewController viewController: UIViewController)
}
