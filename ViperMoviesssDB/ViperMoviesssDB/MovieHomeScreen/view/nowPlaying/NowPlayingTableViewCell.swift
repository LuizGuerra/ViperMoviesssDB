//
//  NowPlayingTableViewCell.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

protocol NowPlayingCollectionViewCellDelegate:class {
    func collectionView(didSelectItemAt indexPath: IndexPath)
    //other delegate methods that you can define to perform action in viewcontroller
}

class NowPlayingTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    let cellReuseId = "NowPlayingCollectionViewCell"
    
    weak var cellDelegate:NowPlayingCollectionViewCellDelegate?
    var movies:[GlobalMovie]?
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //TODO: need to setup collection view flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 152, height: 308)
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.minimumInteritemSpacing = 20.0
        self.mCollectionView.collectionViewLayout = flowLayout
        
        self.mCollectionView.delegate = self
        self.mCollectionView.dataSource = self
        
        //register the xib for collection view cell
        let cellNib = UINib(nibName: "NowPlayingCollectionViewCell", bundle: nil)
        self.mCollectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    
}

extension NowPlayingTableViewCell: UICollectionViewDataSource,
    UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? NowPlayingCollectionViewCell
        self.cellDelegate?.collectionView(didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Movies count = \(movies?.count ?? -1)")
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as? NowPlayingCollectionViewCell
        cell?.title.text = movies?[indexPath.row].title
        cell?.votes.text = String(movies?[indexPath.row].voteAverage ?? 0)
        
        if let imageData = movies?[indexPath.row].albumImage{
            cell?.albumImage.image = UIImage(data: imageData)
        }
        
        return cell!
        
    }
    
    
    
    
}
