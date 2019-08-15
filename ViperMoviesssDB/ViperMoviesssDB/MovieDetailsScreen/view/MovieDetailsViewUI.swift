//
//  MovieDetailsViewUI.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

// MARK: MovieDetailsViewUI Delegate -
/// MovieDetailsViewUI Delegate
protocol MovieDetailsViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: MovieDetailsViewUI Data Source -
/// MovieDetailsViewUI Data Source
protocol MovieDetailsViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: MovieDetailsViewUI) -> MovieDetailsEntity
}

class MovieDetailsViewUI: UIView {
    
    var delegate: MovieDetailsViewUIDelegate?
    var dataSource: MovieDetailsViewUIDataSource?
    
    var object : MovieDetailsEntity?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        // arrange subviews
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        self.object = dataSource?.objectFor(ui: self)
        // Should update UI
    }
}
