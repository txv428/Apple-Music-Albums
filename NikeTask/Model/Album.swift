//
//  Album.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

protocol Album {
    var name: String { get }
    var artist: String { get }
    var artworkUrl: String { get }
    var copyright: String { get }
    var artistId: String { get }
    var urlLink: URL { get }
    var releaseDate: String { get }
    var genres: [GenreDeictionary] { get }
    var hdArtworkString: String { get }
    var id: String { get }
}
