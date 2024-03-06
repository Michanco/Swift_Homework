//
//  ProfileModel.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 04.03.2024.
//

import Foundation

struct ProfileModel: Decodable{
    var items: Profile
}

struct Profile: Decodable{
    //var id: Int
    var firstName: String?
    var lastName: String?
    //var photo: String?
    
    enum CodingKeys: String, CodingKey{
        //case id
        case firstName = "first_name"
        case lastName = "last_name"
        //case photo
    }
}
