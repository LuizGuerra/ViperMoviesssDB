//
//  NowPlayingMoviesResult.swift
//  ViperMoviesssDB
//
//  Created by Anderson Lentz on 15/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nowPlayingMoviesResult = try? newJSONDecoder().decode(NowPlayingMoviesResult, from: jsonData)

import Foundation

// MARK: - NowPlayingMoviesResult
struct NowPlayingMoviesResult: Codable {
    let movies: [Movie]
    let page, totalResults: Int
    let dates: Dates
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
        case page
        case totalResults = "total_results"
        case dates
        case totalPages = "total_pages"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct Movie: Codable {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}
