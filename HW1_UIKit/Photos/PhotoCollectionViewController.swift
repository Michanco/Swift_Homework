//
//  PhotoCollectionViewController.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 15.02.2024.
//

import Foundation
import UIKit

final class PhotoCollectionViewController: UICollectionViewController{
    
    private var networkService = NetworkService()
    private var models:[Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo"
        collectionView.backgroundColor = .gray
        collectionView.register(CustomPhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        
        networkService.getPhoto() { [weak self] photos in
            self?.models = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! CustomPhotoCell
        let model = models[0]
        cell.setupCell(photo: model)
        return cell
    }
}
extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wight = UIScreen.main.bounds.width
        let cellSize = (wight / 2 ) - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}
