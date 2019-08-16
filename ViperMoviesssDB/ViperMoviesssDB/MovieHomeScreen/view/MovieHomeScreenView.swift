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
    

    @IBOutlet weak var tableView: UITableView!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieHomeScreenPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search"
        
        //search.searchBar.barTintColor = UIColor(displayP3Red: 142.0/255, green: 142.0/255, blue: 147.0/255, alpha: 1.0)
       
        //search.searchBar.backgroundColor = UIColor(displayP3Red: 142.0/255, green: 142.0/255, blue: 147.0/255, alpha: 0.12)
        self.navigationItem.searchController = search
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let nowPlayingNib = UINib(nibName: "NowPlayingTableViewCell", bundle: nil)
        self.tableView.register(nowPlayingNib, forCellReuseIdentifier: "NowPlayingTableViewCell")
        
        let popularMoviesNib = UINib(nibName: "PopularMoviesTableViewCell", bundle: nil)
        self.tableView.register(popularMoviesNib, forCellReuseIdentifier: "PopularMoviesTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    
    
}

// MARK: - extending MovieHomeScreenView to implement it's protocol
extension MovieHomeScreenView: MovieHomeScreenViewProtocol {
    func set(object: MovieHomeScreenEntity) {
        
    }
    
    
}

// MARK: - extending MovieHomeScreenView to implement the custom ui view delegate
extension MovieHomeScreenView: MovieHomeScreenViewUIDelegate {
    
}

// MARK: - extending MovieHomeScreenView to implement the custom ui view data source
extension MovieHomeScreenView: MovieHomeScreenViewUIDataSource {
    func objectFor(ui: MovieHomeScreenViewUI) -> MovieHomeScreenEntity {
         return MovieHomeScreenEntity()
    }
    
    // Pass the pre-defined object to the dataSource.
}


extension MovieHomeScreenView : UITableViewDelegate,
    UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else{
            return 10
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Now Playing"
        }else{
            return "Popular Movies"
        }
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingTableViewCell") as! NowPlayingTableViewCell
            cell.movies = nil
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMoviesTableViewCell") as! PopularMoviesTableViewCell
            return cell
        }
    }
    
    
}
