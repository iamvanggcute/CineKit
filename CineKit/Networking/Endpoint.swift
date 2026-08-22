//
//  Endpoint.swift
//  CineKit
//
//  Created by nguyễn văn vang on 20/8/26.
//

import Foundation

enum Endpoint {
    case popular(page: Int = 1)
    case trending(page: Int = 1)
    case topRated(page: Int = 1)
    case nowPlaying(page: Int = 1)
    case searchMovies(query: String, page: Int = 1)
    case movieDetail(id: Int)
    case genreList
    case discover(genreId: Int, page: Int = 1)

    private var baseURL: String {
        "https://api.themoviedb.org/3"
    }

    private var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        case .trending:
            return "/trending/movie/day"
        case .topRated:
            return "/movie/top_rated"
        case .nowPlaying:
            return "/movie/now_playing"
        case .searchMovies:
            return "/search/movie"
        case .movieDetail(let id):
            return "/movie/\(id)"
        case .genreList:
            return "/genre/movie/list"
        case .discover:
            return "/discover/movie"
        }
    }

    private var queryItems: [URLQueryItem] {
        switch self {
        case .popular(let page), .trending(let page), .topRated(let page), .nowPlaying(let page):
            return [URLQueryItem(name: "page", value: "\(page)")]
        case .searchMovies(let query, let page):
            return [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        case .movieDetail:
            return [URLQueryItem(name: "append_to_response", value: "credits,videos,similar")]
        case .genreList:
            return []
        case .discover(let genreId, let page):
            return [
                URLQueryItem(name: "with_genres", value: "\(genreId)"),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        }
    }

    var url: URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = queryItems
        return components?.url
    }
}
