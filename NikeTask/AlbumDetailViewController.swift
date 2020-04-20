//
//  AlbumDetailViewController.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import StoreKit

class AlbumDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFullImage()
    }
        
    // MARK: - Update Views
    
    func updateViews() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        guard let album = album else { return }
        title = album.artistName
        copyRightLabel.text = album.copyright
        nameLabel.text = album.name
        genreLabel.text = album.genres.first?.name ?? "Music"
        releaseDateLabel.text = album.releaseDate
    }
    
    func updateFullImage() {
        guard let hdString = album?.hdArtworkString else { return }
        UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.artworkImageView.loadImage(imagePath: hdString)
        }, completion: nil)
    }
 
    func setUpLayout() {
        view.addSubview(artworkImageView)
        view.addSubview(copyRightLabel)
        view.addSubview(nameLabel)
        view.addSubview(genreLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(itunesBtn)
 
        if (UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isPortrait)! {
            artworkImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, topVal: 5, bottom: nil, bottomVal: 0, left: nil, leftVal: 0, right: nil, rightVal: 0, width: view.bounds.height / 3, height: view.bounds.height / 3, centerXVal: view.centerXAnchor, centerX: true )
        } else {
            artworkImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, topVal: 5, bottom: nil, bottomVal: 0, left: nil, leftVal: 0, right: nil, rightVal: 0, width: 150, height: 150, centerXVal: view.centerXAnchor, centerX: true )
        }
        
        copyRightLabel.anchor(top: artworkImageView.bottomAnchor, topVal: 8, bottom: nil, bottomVal: 0, left: nil, leftVal: 40, right: nil, rightVal: 40, width: view.bounds.width-80, height: 14, centerXVal: view.centerXAnchor, centerX: true)
         
        nameLabel.anchor(top: copyRightLabel.bottomAnchor, topVal: 15, bottom: nil, bottomVal: 0, left: view.leftAnchor, leftVal: 25, right: nil, rightVal: 0, width: view.bounds.width-40, height: 0, centerXVal: view.centerXAnchor, centerX: false)
        nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        genreLabel.anchor(top: nameLabel.bottomAnchor, topVal: 5, bottom: nil, bottomVal: 0, left: view.leftAnchor, leftVal: 25, right: nil, rightVal: 0, width: view.bounds.width-40, height: 20, centerXVal: view.centerXAnchor, centerX: false)
     
        releaseDateLabel.anchor(top: genreLabel.bottomAnchor, topVal: 5, bottom: nil, bottomVal: 0, left: view.leftAnchor, leftVal: 25, right: nil, rightVal: 0, width: view.bounds.width-40, height: 20, centerXVal: view.centerXAnchor, centerX: false)
        
        itunesBtn.anchor(top: nil, topVal: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomVal: 20, left: view.leftAnchor, leftVal: 20, right: view.rightAnchor, rightVal: 20, width: 0, height: 50, centerXVal: view.centerXAnchor, centerX: false)
        itunesBtn.addTarget(self, action: #selector(iTunesButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func iTunesButtonPressed() {
        
        #if targetEnvironment(simulator)
        ErrorMessage(titleStr: "Oops, It's Simulator", messageStr: "Can't open iTunes in Simulator. Try in iPhone")
        #else
        openItunesWith(identifier: album?.id ?? "563355119")
        
        #endif
    }
    
    // MARK: - Properties
    
    var album: AlbumModel?
    var artworkImage: UIImage? {
        didSet {
            artworkImageView.image = artworkImage
        }
    }
    
    let artworkImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    let copyRightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        label.numberOfLines = 0
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        label.numberOfLines = 0
        return label
    }()
    
    let itunesBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("View in iTunes", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15
        btn.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        return btn
    }()
}

extension AlbumDetailViewController: SKStoreProductViewControllerDelegate {
    
    func openItunesWith(identifier: String) {
        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = self
        
        let parameters = [ SKStoreProductParameterITunesItemIdentifier : identifier]
        storeViewController.loadProduct(withParameters: parameters) { [weak self] (loaded, error) -> Void in
            if let error = error {
                self?.ErrorMessage(titleStr: "Error Loading iTunes", messageStr: error.localizedDescription)
            }
            if loaded {
                self?.present(storeViewController, animated: true, completion: nil)
            }
        }
    }
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
