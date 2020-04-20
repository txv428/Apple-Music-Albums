//
//  AlbumModel.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct Albums: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [AlbumModel]
}

struct AlbumModel: Decodable {
    var name: String
    var artistName: String
    var artworkUrl100: String
    var copyright: String
    var artistId: String
    var url: URL
    var releaseDate: String
    var genres: [Genre]
    var id: String
    
    var hdArtworkString: String {
        let urlString = artworkUrl100
        return urlString.replacingOccurrences(of: "200", with: "1000")
    }
}

struct Genre: Decodable {
    let name: String
}
