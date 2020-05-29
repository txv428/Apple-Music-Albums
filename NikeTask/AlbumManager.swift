//
//  AlbumManager.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct AlbumManager {
    
    private let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json")!
    
//    let urlNew = "http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=\(Date().asString14DaysFromNow())"
    
    
    
    typealias AlbumCompletion = ((Result<[AlbumModel], NetworkError>) -> Void)
    
    func fetchTopAlbums(completion: @escaping (AlbumCompletion)) {
        
        NetworkManager.performRequest(for: url) { (data, error) in
            
            if let error = error {
                print("Error performing Network Request \(error) \(#file) \(#function)")
                completion(.failure(.forwarded(error))); return
            }
            guard let date = data else { completion(.failure(.noDataReturned)); return }
            
            do {
                
                let results = try JSONDecoder().decode(Albums.self, from: date).feed.results
                completion(.success(results))
                
            } catch let e {
                print("Error with JsonDecoder \(e) \(e.localizedDescription)")
                completion(.failure(.dataNotDecodable)); return
            }
        }
    }
}
