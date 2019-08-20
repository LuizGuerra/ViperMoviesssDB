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
    

    var presenter: MovieDetailsPresenterProtocol?
    var movie: GlobalMovie?
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.viewDidLoad()
    }
    
    func configureView(){
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        let movieDetailsHeaderNib = UINib.init(nibName: "MovieDetailsHeader", bundle: nil)
        self.mTableView.register(movieDetailsHeaderNib, forHeaderFooterViewReuseIdentifier: "movieDetailsHeaderID")
        
        let overviewHeaderNib = UINib.init(nibName: "OverviewHeader", bundle: nil)
        self.mTableView.register(overviewHeaderNib, forHeaderFooterViewReuseIdentifier: "overviewHeaderID")
        
        
        self.mTableView.delegate = self
        self.mTableView.dataSource = self
        
        //Autolayout row size
        self.mTableView.rowHeight = UITableView.automaticDimension
        self.mTableView.estimatedRowHeight = 194
        
        //Removed separator line
        self.mTableView.separatorStyle = .none
        
    }
    
}

// MARK: - extending MovieDetailsView to implement it's protocol
extension MovieDetailsView: MovieDetailsViewProtocol {
    func showMovieDetails(with movie: GlobalMovie?) {
        self.movie = movie
        print("Movie from home screen")
        print(movie)
        DispatchQueue.main.async {
            self.mTableView.reloadData()
        }
    }
    
  
    
}



extension MovieDetailsView: UITableViewDelegate,
UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if movie == nil{
            return 0
        }
        else{
            if section == 0{
                return 0
            }
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieOverviewCell") as! MovieOverviewTableViewCell
        cell.overviewLabel.text = movie?.overview
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if movie == nil{
            return 0
        }else{
            return 2
        }
  
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0{
            return 194
        }else{
            return 32
        }

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "movieDetailsHeaderID") as! MovieDetailsViewHeader
            headerView.titleLabel.text = movie?.title
            headerView.loadingIndicator.startAnimating()
            headerView.votesAverage.text = String(movie?.voteAverage ?? 0)
            
            return headerView
        }
        if section == 1{
            let overviewHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "overviewHeaderID") as! OverviewViewHeader
            print("entrou")
            return overviewHeaderView
        }
        
        return nil
    }
    
    
}
