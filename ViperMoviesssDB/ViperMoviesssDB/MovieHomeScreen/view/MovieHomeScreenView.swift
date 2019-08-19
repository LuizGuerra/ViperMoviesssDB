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
    
    var nowPlayingMovies: [Movie]?
    var popularMovies: [Movie]?
    
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
    
}

extension MovieHomeScreenView: MovieHomeScreenViewProtocol {
   
    // Presenter -> View
    func showNowPlayingMovies(with movies: [Movie]?){
        nowPlayingMovies = movies
        tableView.reloadData()
    }
    
    func showPopularMovies(with movies: [Movie]?){
        popularMovies = movies
        tableView.reloadData()
    }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 308
        }else{
            return 137.5
        }
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingTableViewCell") as! NowPlayingTableViewCell
            cell.cellDelegate = self
            cell.movies = nil
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMoviesTableViewCell") as! PopularMoviesTableViewCell
            return cell
        }
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "nowPlayingHeaderID") as! NowPlayingViewHeader
            return headerView
        } else {
            return nil
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
    func collectionView(collectioncell: NowPlayingCollectionViewCell?, didTappedInTableview TableCell: NowPlayingTableViewCell) {
        
        let movie = Movie(voteCount: 0, id: 0, video: false, voteAverage: 7.2, title: "Piratas do Carible", popularity: 8.9, posterPath: nil, originalLanguage: .en, originalTitle: "Piratas", genreIDS: [0], backdropPath: nil, adult: false, overview: "Teste overview", releaseDate: "20-12-2012")
        
        print("didTappedInTableView cell")
        
        presenter?.showMovieDetails(with: movie, from: self)
    }
}

extension MovieHomeScreenView : UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
    
    
}

