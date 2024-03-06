//
//  ProfileViewController.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 04.03.2024.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    private var netvorkservice = NetworkService()
    
    
    private var photo: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .green
        photo.layer.cornerRadius = 10
        photo.layer.masksToBounds = true
        return photo
    }()
    
    private var profileName: UILabel = {
       let label = UILabel()
       label.textColor = .black
       label.backgroundColor = .clear
       return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .gray
        netvorkservice.getProfileName()
        setupViews()
    }
    
    private func setupViews(){
        view.addSubview(photo)
        view.addSubview(profileName)
        setupConstraints()
    }
    
    private func setupConstraints(){
        photo.translatesAutoresizingMaskIntoConstraints = false
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //photo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            photo.heightAnchor.constraint(equalToConstant: 50),
            photo.widthAnchor.constraint(equalTo: photo.heightAnchor),
            
            profileName.topAnchor.constraint(equalTo: photo.topAnchor),
            profileName.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            profileName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            //profileName.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            profileName.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    
}
