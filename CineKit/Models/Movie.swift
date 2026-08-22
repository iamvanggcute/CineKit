//
//  Movie.swift
//  CineKit
//
//  Created by nguyễn văn vang on 22/8/26.
//

struct Movie: Decodable {
    let id: Int
    let title: String
    let posterPath: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
