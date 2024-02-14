//
//  CustonFriendsCell.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 13.02.2024.
//

import Foundation
import UIKit

final class CustomFriendsCell: UITableViewCell{
    
    private var photo: UIImageView = {
        let photo = UIImage()
        var myImageView = UIImageView(image: photo)
        return myImageView
    }()
    
    private var name: UILabel = {
       let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        label.font = .systemFont(ofSize: 45)
        label.textAlignment = .center
        label.backgroundColor = .green
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.addSubview(photo)
        contentView.addSubview(name)
        setupConstraints()
    }
    
    private func setupConstraints(){
        photo.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photo.heightAnchor.constraint(equalToConstant: 50),
            
            name.topAnchor.constraint(equalTo: photo.topAnchor),
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
        
}
