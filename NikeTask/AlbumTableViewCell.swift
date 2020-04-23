//
//  AlbumTableViewCell.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    // MARK: - Props
    var album: AlbumModel? {
        didSet {
            nameLabel.text = album?.name
            artistLabel.text = album?.artistName
        }
    }
    var artworkPath: String? {
        didSet {
            guard let album = album else { return }
            artworkImageView.loadImage(imagePath: album.artworkUrl100)
        }
    }
    
    // MARK: - Auto Layout UI's
    
    let artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    // MARK: - Initailzer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(artworkImageView)
        addSubview(nameLabel)
        addSubview(artistLabel)
        
        self.accessibilityElementsHidden = true
        
        artworkImageView.anchor(top: topAnchor, topVal: 20, bottom: nil, bottomVal: 0, left: leftAnchor, leftVal: 12, right: nil, rightVal: 0, width: 150, height: 150, centerXVal: leftAnchor, centerX: false)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, artistLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        addSubview(stackView)

        stackView.anchor(top: topAnchor, topVal: 20, bottom: bottomAnchor, bottomVal: 25, left: artworkImageView.rightAnchor, leftVal: 15, right: rightAnchor, rightVal: 15, width: 0, height: 150, centerXVal: leftAnchor, centerX: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
