//
//  NowPlayingView.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 20/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// NowPlaying Module View
class NowPlayingView: UIViewController {
    
    
    private var presenter: NowPlayingPresenterProtocol!
    
    private var object : NowPlayingEntity?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = NowPlayingPresenter(view: self)

    }
    
}

// MARK: - extending NowPlayingView to implement it's protocol
extension NowPlayingView: NowPlayingViewProtocol {
    
}

