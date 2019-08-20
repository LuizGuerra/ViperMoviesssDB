//
//  NowPlayingPresenter.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 20/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// NowPlaying Module Presenter
class NowPlayingPresenter {
    
    weak private var _view: NowPlayingViewProtocol?
    private var interactor: NowPlayingInteractorProtocol
    private var wireframe: NowPlayingRouterProtocol
    
    init(view: NowPlayingViewProtocol) {
        self._view = view
        self.interactor = NowPlayingInteractor()
        self.wireframe = NowPlayingRouter()
    }
}

// MARK: - extending NowPlayingPresenter to implement it's protocol
extension NowPlayingPresenter: NowPlayingPresenterProtocol {
    
}
