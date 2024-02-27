//
//  CustomGroupsCell.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 13.02.2024.
//

import Foundation
import UIKit

final class CustomGroupsCell: UITableViewCell{
    
    private var logo: UIView = {
        let circle = UIView()
        circle.backgroundColor = .green
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    private var groupName: UILabel = {
        let label = UILabel()
        //label.text = "groupName"
        label.textColor = .black
        label.backgroundColor = .blue
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
    
    func setupCell(group:GroupsModel){
        groupName.text = group.response.items[0].name
    }
    
    private func setupViews(){
        contentView.addSubview(logo)
        contentView.addSubview(groupName)
        setupConstraints()
    }
    
    private func setupConstraints(){
        logo.translatesAutoresizingMaskIntoConstraints = false
        groupName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //logo.heightAnchor.constraint(equalToConstant: 50),
            logo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            logo.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
            logo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            logo.trailingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 70),
            //logo.widthAnchor.constraint(equalToConstant: 70),
            
            
            groupName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            groupName.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 20),
            groupName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            groupName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
}
