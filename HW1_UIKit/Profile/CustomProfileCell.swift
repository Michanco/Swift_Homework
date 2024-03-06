//
//  CustomProfileCell.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 04.03.2024.
//

import Foundation
import UIKit

final class CustomProfileCell: UITableViewCell{
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        //setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
