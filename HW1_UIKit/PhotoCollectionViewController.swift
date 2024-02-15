//
//  PhotoCollectionViewController.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 15.02.2024.
//

import Foundation
import UIKit

final class PhotoCollectionViewController: UICollectionViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.backgroundColor = .brown
        }
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            6
        }
}
