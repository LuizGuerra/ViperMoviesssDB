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
    
    @IBOutlet weak var mTableView: UITableView!
    
    
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
        
        let movieDetailsHeaderNib = UINib.init(nibName: "MovieDetailsHeader", bundle: Bundle.main)
        self.mTableView.register(movieDetailsHeaderNib, forHeaderFooterViewReuseIdentifier: "movieDetailsHeaderID")
    
    
        self.mTableView.delegate = self
        self.mTableView.dataSource = self
    }
    
}

// MARK: - extending MovieDetailsView to implement it's protocol
extension MovieDetailsView: MovieDetailsViewProtocol {
    func set(object: MovieDetailsEntity) {
        
    }
    
    
}

// MARK: - extending MovieDetailsView to implement the custom ui view delegate
extension MovieDetailsView: MovieDetailsViewUIDelegate {
    
}

// MARK: - extending MovieDetailsView to implement the custom ui view data source
extension MovieDetailsView: MovieDetailsViewUIDataSource {
    func objectFor(ui: MovieDetailsViewUI) -> MovieDetailsEntity {
        return MovieDetailsEntity()
    }
    
    // Pass the pre-defined object to the dataSource.
}

extension MovieDetailsView: UITableViewDelegate,
UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "overviewCell") as! MovieOverviewTableViewCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "Overview"
        }
        
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 194
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "movieDetailsHeaderID") as! NowPlayingViewHeader
            return headerView
        }else {
            return nil
        }
    }
    
    
}
