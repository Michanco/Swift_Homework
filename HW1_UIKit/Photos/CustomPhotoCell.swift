//
//  CustomPhotoCell.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 19.02.2024.
//

import Foundation
import UIKit

final class CustomPhotoCell: UICollectionViewCell {
    
    private let photoView: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .clear
        photo.layer.cornerRadius = 10
        photo.layer.masksToBounds = true
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(photo: Photo){
        DispatchQueue.global().async {
            if let url = URL(string: photo.sizes[0].url ?? ""), let data = try? Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.photoView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews(){
        addSubview(photoView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photoView.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoView.topAnchor.constraint(equalTo: topAnchor),
            photoView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoView.image = nil
    }
}
