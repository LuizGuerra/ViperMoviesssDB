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
    
    
    @IBOutlet weak var playingNowCollectionView: UICollectionView!
    var presenter: NowPlayingPresenterProtocol?
    
    private var object : NowPlayingEntity?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Setup navigation bar title
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}

// MARK: - extending NowPlayingView to implement it's protocol
extension NowPlayingView: NowPlayingViewProtocol {
    
}

