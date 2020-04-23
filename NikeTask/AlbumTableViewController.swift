//
//  AlbumListTableViewController.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    
    // MARK: - Props
    let albumManager: AlbumManager
    fileprivate var albums = [AlbumModel]()
    private let albumDetailVC = AlbumDetailViewController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "albumCellId")        
        setUpUi()
        fetchAlbums()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UISetUp
    
    func setUpUi() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        title = "Music Albums"
        tableView.separatorStyle = .none
    }
    
    func fetchAlbums() {
        albumManager.fetchTopAlbums { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let albums):
                self.albums = albums
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.ErrorMessage(titleStr: "Error Displaying Albums", messageStr: error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Initializers
    
    init(albumManager: AlbumManager) {
        self.albumManager = albumManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlbumTableViewController {
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "albumCellId", for: indexPath) as? AlbumTableViewCell else { return UITableViewCell() }
        
        let album = albums[indexPath.row]
        cell.album = album
        cell.artworkPath = album.artworkUrl100
        cell.isAccessibilityElement = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlbumTableViewCell else { return }
        cell.isAccessibilityElement = true
        let album = self.albums[indexPath.row]
        let albumDetailVC = AlbumDetailViewController()
        albumDetailVC.album = album
        albumDetailVC.artworkImage = cell.artworkImageView.image
        navigationController?.pushViewController(albumDetailVC, animated: true)
    }
}
