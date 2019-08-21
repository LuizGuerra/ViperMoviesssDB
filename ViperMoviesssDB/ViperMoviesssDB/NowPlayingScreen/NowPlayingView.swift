//
//  NowPlayingView.swift
//  ViperMoviesssDB
//
//  Created Anderson Lentz on 20/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

/// NowPlaying Module View
class NowPlayingView: UIViewController {
    
    
    @IBOutlet weak var playingNowCollectionView: UICollectionView!
    var presenter: NowPlayingPresenterProtocol?
    private var movies:[GlobalMovie]?
    
    private var object : NowPlayingEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        playingNowCollectionView.delegate = self
        playingNowCollectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 129, height: 308)
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.minimumInteritemSpacing = 20.0
        playingNowCollectionView.collectionViewLayout = flowLayout
        
        //register the xib for collection view cell
        let cellNib = UINib(nibName: "NowPlayingCollectionViewCell", bundle: nil)
        playingNowCollectionView.register(cellNib, forCellWithReuseIdentifier: "NowPlayingCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Setup navigation bar title
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}

// MARK: - extending NowPlayingView to implement it's protocol
extension NowPlayingView: NowPlayingViewProtocol {
    func showNowPlayingMovies(with: [GlobalMovie]?) {
        movies = with
        playingNowCollectionView.reloadData()
    }
}

extension NowPlayingView: UICollectionViewDelegate,
UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movies?.count)
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowPlayingCollectionViewCell", for: indexPath) as! NowPlayingCollectionViewCell
        cell.title.text = movies?[indexPath.row].title
        cell.votes.text = String(movies?[indexPath.row].voteAverage ?? 0)
        
        if let imageData = movies?[indexPath.row].albumImage{
            cell.albumImage.image = UIImage(data: imageData)
        }
        return cell
    }
    
    
    
}
