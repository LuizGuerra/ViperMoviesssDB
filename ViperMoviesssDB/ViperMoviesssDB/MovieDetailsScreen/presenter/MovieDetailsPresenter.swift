//
//  MovieDetailsPresenter.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieDetails Module Presenter
class MovieDetailsPresenter: MovieDetailsPresenterProtocol {

    var view: MovieDetailsViewProtocol?
    var interactor: MovieDetailsInteractorProtocol?
    var wireframe: MovieDetailsRouterProtocol?
    var movie: GlobalMovie?
    
    func viewDidLoad() {
        view?.showMovieDetails(with: movie)
    }
}
