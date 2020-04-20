//
//  NetworkManager.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // dataTask to retrieve the json data contents from json URL
    static func performRequest(for url: URL, urlParameters: [String : String]? = nil, body: Data? = nil, completion: ((Data?, Error?) -> Void)? = nil) {
        
        // url request
        let request = URLRequest(url: url)
        
        // Create and run task
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in completion?(data, error)
        }
        dataTask.resume()
    }
}
