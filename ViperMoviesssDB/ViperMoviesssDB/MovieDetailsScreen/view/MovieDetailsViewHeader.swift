//
//  MovieDetailsViewHeader.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

class MovieDetailsViewHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var votesAverage: UILabel!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
}
