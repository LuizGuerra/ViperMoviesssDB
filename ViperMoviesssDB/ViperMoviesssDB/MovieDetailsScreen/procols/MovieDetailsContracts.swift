//
//  MovieDetailsContracts.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// MovieDetails Module View Protocol
protocol MovieDetailsViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type MovieDetailsEntity
    
}

//MARK: Interactor -
/// MovieDetails Module Interactor Protocol
protocol MovieDetailsInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: MovieDetailsPresenterProtocol)
}

//MARK: Presenter -
/// MovieDetails Module Presenter Protocol
protocol MovieDetailsPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: MovieDetailsViewProtocol)

    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: MovieDetailsInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// MovieDetails Module Router Protocol
protocol MovieDetailsRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: MovieDetailsEntity, parentViewController viewController: UIViewController)
}
