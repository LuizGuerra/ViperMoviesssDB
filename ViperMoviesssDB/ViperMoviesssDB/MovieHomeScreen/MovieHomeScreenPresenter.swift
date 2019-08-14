//
//  MovieHomeScreenPresenter.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieHomeScreen Module Presenter
class MovieHomeScreenPresenter {
    
    weak private var _view: MovieHomeScreenViewProtocol?
    private var interactor: MovieHomeScreenInteractorProtocol
    private var wireframe: MovieHomeScreenRouterProtocol
    
    init(view: MovieHomeScreenViewProtocol) {
        self._view = view
        self.interactor = MovieHomeScreenInteractor()
        self.wireframe = MovieHomeScreenRouter()
    }
}

// MARK: - extending MovieHomeScreenPresenter to implement it's protocol
extension MovieHomeScreenPresenter: MovieHomeScreenPresenterProtocol {
    
}
