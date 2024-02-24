//
//  PhotoModel.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 24.02.2024.
//

import Foundation

struct PhotoModel: Decodable{
    var items: [Photo]
}

struct Photo: Decodable{
    var id: Int
    var text: String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case text
    }
}
