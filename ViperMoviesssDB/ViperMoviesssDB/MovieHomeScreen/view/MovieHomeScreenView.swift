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
    
    
    var presenter: MovieHomeScreenPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    var nowPlayingMovies: [GlobalMovie]?
    var popularMovies: [GlobalMovie]?
    
    var isSearchingMovie = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dependency injection and module initialization
        MovieHomeScreenRouter.homeScreenModuleCreator(homeScreenRef: self)
        
        configureView()
        
        presenter?.viewDidLoad()
        
    }
    
    func configureView(){
        
        //Setup navigation bar title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search"

        self.navigationItem.searchController = search
        self.navigationItem.searchController?.searchBar.delegate = self
        
        //Now playing movies Xib Cell
        let nowPlayingNib = UINib(nibName: "NowPlayingTableViewCell", bundle: nil)
        self.tableView.register(nowPlayingNib, forCellReuseIdentifier: "NowPlayingTableViewCell")
        
        // Popular movie Xib Cell
        let popularMoviesNib = UINib(nibName: "PopularMoviesTableViewCell", bundle: nil)
        self.tableView.register(popularMoviesNib, forCellReuseIdentifier: "PopularMoviesTableViewCell")
        
        //Section header for Now Playing section
        let nowPlayingHeaderNib = UINib.init(nibName: "NowPlayingHeader", bundle: Bundle.main)
        self.tableView.register(nowPlayingHeaderNib, forHeaderFooterViewReuseIdentifier: "nowPlayingHeaderID")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 308
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    @objc func seeAllButtonClicked(sender:UIButton){
        presenter?.showNowPlayingSeeAllMovies(from: self)
    }
    
}

extension MovieHomeScreenView: MovieHomeScreenViewProtocol {
   
    // Presenter -> View comunication
    func showNowPlayingMovies(with movies: [GlobalMovie]?){
        
        nowPlayingMovies = movies

        DispatchQueue.main.async {
            self.tableView.reloadInputViews()
            self.tableView.reloadData()
            
        }

    }
    
    func showPopularMovies(with movies: [GlobalMovie]?){
        popularMovies = movies
        
        tableView.reloadInputViews()
        tableView.reloadData()
        
    }
}

extension MovieHomeScreenView : UITableViewDelegate,
    UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearchingMovie{
            return 1
        }else{
            if section == 0{
                // Now Playing section
                return 1
            }
            
            if section == 1{
                return popularMovies?.count ?? 0
            }
            
        }
        
        return 0

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        if isSearchingMovie{
            return 1
        }else{
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if !isSearchingMovie{
            if section == 0{
                return "Now Playing"
            }else{
                return "Popular Movies"
            }
            
        }else{
            return "Showing 20 results"
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 308
        }else{
            return 137.5
        }
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSearchingMovie{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingTableViewCell") as! NowPlayingTableViewCell
            
            cell.cellDelegate = self
            cell.movies = nil
            return cell
        }else{
            
            if indexPath.section == 0{
                //Now Playing section
                let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingTableViewCell") as! NowPlayingTableViewCell
                cell.cellDelegate = self
                cell.mCollectionView.reloadData()
                print("nowPlayingMovies \(nowPlayingMovies?.count ?? 0)")
                cell.movies = nowPlayingMovies
                
                return cell
            }else{
                // Popular Movies Section
                let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMoviesTableViewCell") as! PopularMoviesTableViewCell
                cell.detailLabel.text = popularMovies?[indexPath.row].overview
                cell.titleLabel.text = popularMovies?[indexPath.row].title
                cell.votesLabel.text = String(popularMovies?[indexPath.row].voteAverage ?? 0)
                
                if let imageData = popularMovies?[indexPath.row].albumImage{
                    cell.albumImage.image = UIImage(data: imageData)
                }
                
              
                
                return cell
            }
            
        }
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isSearchingMovie{
            return nil
        }
        else{
            if section == 0{
                let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "nowPlayingHeaderID") as! NowPlayingViewHeader
                
                headerView.seeAllButton.addTarget(self, action:#selector(self.seeAllButtonClicked), for: .touchUpInside)
           
                return headerView
            }else {
                return nil
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(indexPath)")
    }
    
    
}

extension MovieHomeScreenView: NowPlayingCollectionViewCellDelegate{
    func collectionView(didSelectItemAt indexPath: IndexPath) {

        presenter?.showMovieDetails(with: nowPlayingMovies?[indexPath.row], from: self)
    }

}

extension MovieHomeScreenView : UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearchingMovie = true
        
        if searchBar.text == ""{
            isSearchingMovie = false
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadInputViews()
            self.tableView.reloadData()
        }
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearchingMovie = true
        DispatchQueue.main.async {
            self.tableView.reloadInputViews()
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearchingMovie = false
        DispatchQueue.main.async {
            self.tableView.reloadInputViews()
            self.tableView.reloadData()
        }
    }
   
}

