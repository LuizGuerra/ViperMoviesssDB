//
//  MovieDetailsPresenter.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieDetails Module Presenter
class MovieDetailsPresenter {
    
    weak private var _view: MovieDetailsViewProtocol?
    private var interactor: MovieDetailsInteractorProtocol
    private var wireframe: MovieDetailsRouterProtocol
    
    init(view: MovieDetailsViewProtocol) {
        self._view = view
        self.interactor = MovieDetailsInteractor()
        self.wireframe = MovieDetailsRouter()
    }
}

// MARK: - extending MovieDetailsPresenter to implement it's protocol
extension MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    func fetch(objectFor view: MovieDetailsViewProtocol) {
        
    }
    
   
    
    func interactor(_ interactor: MovieDetailsInteractorProtocol, didFailWith error: Error) {
        
    }
    
    
}
