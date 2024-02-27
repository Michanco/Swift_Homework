//
//  NetworkService.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 21.02.2024.
//

import Foundation
import WebKit

final class NetworkService{
    
    static var token:String = ""
    private let session = URLSession.shared
    
    func getFriends (){
        guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50,online&access_token=\(NetworkService.token)&v=5.131")
        else{
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                 let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                print(friends)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getGroups (completion: @escaping ([GroupsModel]) -> Void){
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&v=5.131&extended=1")
                
        else{
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                 let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                completion(groups) // ERROR Cannot convert value of type 'GroupsModel' to expected argument type '[GroupsModel]'
                print(groups)
            } catch {
                print(error)
            }
        }.resume()
    }
    func getPhoto (){
        guard let url = URL(string: "https://api.vk.com/method/photos.get?fields=51860886&access_token=\(NetworkService.token)&v=5.131&album_id=profile")
        else{
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                 let photos = try JSONDecoder().decode(PhotoModel.self, from: data)
                print(photos)
            } catch {
                print(error)
            }
        }.resume()
    }
    
}


