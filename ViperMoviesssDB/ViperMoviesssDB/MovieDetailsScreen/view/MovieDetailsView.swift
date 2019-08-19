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
    

    private var presenter: MovieDetailsPresenterProtocol!
    
    private var object : MovieDetailsEntity?
    
  
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //presenter = MovieDetailsPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        //presenter.fetch(objectFor: self)
        
        configureView()
        
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
    func set(object: MovieDetailsEntity) {
        
    }
    
    
}



extension MovieDetailsView: UITableViewDelegate,
UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieOverviewCell") as! MovieOverviewTableViewCell
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0{
            return 194
        }else{
            return 32
        }

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        print(section)
        if section == 0{
             let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "movieDetailsHeaderID") as! MovieDetailsViewHeader
            return headerView
        }else{
            print("siw8dhfu8")
        }
        
        if section == 1{
            let overviewHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "overviewHeaderID") as! OverviewViewHeader
            print("entrou")
            return overviewHeaderView
        }
        
        return nil
    }
    
    
}
