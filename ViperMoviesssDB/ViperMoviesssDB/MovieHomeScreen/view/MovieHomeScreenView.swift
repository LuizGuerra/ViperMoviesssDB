//
//  MovieHomeScreenView.swift
//  ViperMoviesssDB
//
//  Created Luiz Pedro Franciscatto Guerra on 14/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieHomeScreen Module View
class MovieHomeScreenView: UIViewController {
    
    private let ui = MovieHomeScreenViewUI()
    private var presenter: MovieHomeScreenPresenterProtocol!
    
    private var object : MovieHomeScreenEntity?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieHomeScreenPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending MovieHomeScreenView to implement it's protocol
extension MovieHomeScreenView: MovieHomeScreenViewProtocol {
    func set(object: MovieHomeScreenEntity) {
        <#code#>
    }
    
    
}

// MARK: - extending MovieHomeScreenView to implement the custom ui view delegate
extension MovieHomeScreenView: MovieHomeScreenViewUIDelegate {
    
}

// MARK: - extending MovieHomeScreenView to implement the custom ui view data source
extension MovieHomeScreenView: MovieHomeScreenViewUIDataSource {
    func objectFor(ui: MovieHomeScreenViewUI) -> MovieHomeScreenEntity {
        <#code#>
    }
    
    // Pass the pre-defined object to the dataSource.
}
