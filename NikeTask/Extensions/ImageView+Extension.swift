//
//  ImageView+Extension.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(imagePath: String) {
        
        guard let url = URL(string: imagePath) else {
            print("Indvalid URL")
            return
        }

        NetworkManager.performRequest(for: url, body: nil) { (data, error) in
            if let err = error {
                print("Error getting image data: \(err.localizedDescription) \(#file) : \(#function)"); return
            }
            
            guard let data = data else { print("No From image"); return }
            
            guard let image = UIImage(data: data) else {
                print("Couldn't Find an image")
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

