//
//  GroupsModel.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 24.02.2024.
//

import Foundation

struct GroupsModel: Decodable{
    var response: Groups
}

struct Groups: Decodable {
    var items: [Group]
}

struct Group: Decodable{
    var id: Int
    var name: String?
    var isClosed : Int?
    var photo: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case isClosed = "is_closed"
        case photo = "photo_50"
        case description
    }
}
