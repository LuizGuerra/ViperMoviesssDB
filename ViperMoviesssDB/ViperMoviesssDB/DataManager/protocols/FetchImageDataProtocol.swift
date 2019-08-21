//
//  FetchImageDataProtocol.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

protocol FetchImageDataProtocol {
    
    func fetchImage(posterPath: String,completion: @escaping (Data)->Void)
    
}
