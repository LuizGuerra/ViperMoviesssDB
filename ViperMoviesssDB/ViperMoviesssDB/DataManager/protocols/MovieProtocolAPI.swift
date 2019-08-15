//
//  MovieProtocolAPI.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

protocol MovieDbApiProtocol {
    func fetchNowPlayingMovies(completion: @escaping ([Movie]?) -> Void)
    func fetchAlbumImage(posterPath:String, completion: @escaping (Album) -> Void)
}
