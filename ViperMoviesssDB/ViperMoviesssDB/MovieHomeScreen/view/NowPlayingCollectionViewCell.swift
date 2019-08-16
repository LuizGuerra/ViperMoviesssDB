//
//  NowPlayingCollectionViewCell.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var votes: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
