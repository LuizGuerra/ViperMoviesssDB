//
//  MovieDetailsContracts.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

//MARK: View 

protocol MovieDetailsViewProtocol: class {
    //Presenter -> View
    func showMovieDetails(with movie:GlobalMovie?)
}

//MARK: Interactor
protocol MovieDetailsInteractorProtocol {
    var presenter: MovieDetailsPresenterProtocol?{get set}
}

//MARK: Presenter 
protocol MovieDetailsPresenterProtocol {
    var interactor: MovieDetailsInteractorProtocol? {get set}
    var view: MovieDetailsViewProtocol? {get set}
    var wireframe: MovieDetailsRouterProtocol? {get set}
    var movie: GlobalMovie? {get set}
    
    //View -> Presenter
    func viewDidLoad()
}

//MARK: Router (aka: Wireframe) -
/// MovieDetails Module Router Protocol
protocol MovieDetailsRouterProtocol {
  
}
