//
//  FriendsModel.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 22.02.2024.
//

//import Foundation

struct FriendsModel: Decodable{
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}

struct Friend: Decodable{
    var id: Int
    var firstName: String?
    var lastName : String?
    var photo: String?
    var online: Int?
    
    enum CodingKeys: String, CodingKey{
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }
}

