//
//  CustonFriendsCell.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 13.02.2024.
//

import Foundation
import UIKit

final class CustomFriendsCell: UITableViewCell{
    
//    private var photo: UIImageView = {
//        let photo = UIImage(named: "SwiftLogo")
//        var myImageView = UIImageView(image: photo)
//        return myImageView
//    }()
    
    private var photo: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .green
        photo.layer.cornerRadius = 10
        photo.layer.masksToBounds = true
        return photo
    }()
    
    private var friendName: UILabel = {
       let label = UILabel()
        //label.text = "Name"
        label.textColor = .black
        //label.font = .systemFont(ofSize: 45)
        //label.textAlignment = .center
        label.backgroundColor = .clear
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
    
    func setupCell(friend:Friend){
        friendName.text = "\(friend.firstName ?? "") \(friend.lastName ?? "")"
        DispatchQueue.global().async {
            if let url = URL(string: friend.photo ?? ""), let data = try? Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.photo.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews(){
        contentView.addSubview(photo)
        contentView.addSubview(friendName)
        setupConstraints()
    }
    
    private func setupConstraints(){
        photo.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //photo.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            photo.heightAnchor.constraint(equalToConstant: 50),
            photo.widthAnchor.constraint(equalTo: photo.heightAnchor),
            
            friendName.topAnchor.constraint(equalTo: photo.topAnchor),
            friendName.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            friendName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            friendName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
        
}
