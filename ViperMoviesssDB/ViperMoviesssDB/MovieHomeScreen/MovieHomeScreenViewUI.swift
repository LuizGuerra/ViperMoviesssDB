//
//  MovieHomeScreenViewUI.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

// MARK: MovieHomeScreenViewUI Delegate -
/// MovieHomeScreenViewUI Delegate
protocol MovieHomeScreenViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: MovieHomeScreenViewUI Data Source -
/// MovieHomeScreenViewUI Data Source
protocol MovieHomeScreenViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: MovieHomeScreenViewUI) -> MovieHomeScreenEntity
}

class MovieHomeScreenViewUI: UIView {
    
    var delegate: MovieHomeScreenViewUIDelegate?
    var dataSource: MovieHomeScreenViewUIDataSource?
    
    var object : MovieHomeScreenEntity?
    
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
