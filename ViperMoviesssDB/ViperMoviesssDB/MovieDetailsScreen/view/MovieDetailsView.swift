//
//  MovieDetailsView.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// MovieDetails Module View
class MovieDetailsView: UIViewController {
    
    private let ui = MovieDetailsViewUI()
    private var presenter: MovieDetailsPresenterProtocol!
    
    private var object : MovieDetailsEntity?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieDetailsPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending MovieDetailsView to implement it's protocol
extension MovieDetailsView: MovieDetailsViewProtocol {
    
}

// MARK: - extending MovieDetailsView to implement the custom ui view delegate
extension MovieDetailsView: MovieDetailsViewUIDelegate {
    
}

// MARK: - extending MovieDetailsView to implement the custom ui view data source
extension MovieDetailsView: MovieDetailsViewUIDataSource {
    // Pass the pre-defined object to the dataSource.
}
