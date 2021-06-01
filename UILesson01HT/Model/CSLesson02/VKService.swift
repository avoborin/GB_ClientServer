//
//  VKService.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 01.06.2021.
//

import Foundation
import WebKit
import Alamofire


//func vkService (addressUrl: String) {
//
//    let baseUrl =
//
//}


func getfriends() {
    AF.request("https://api.vk.com/method/friends.get?fields=first_name&count=5&access_token=\(Session.shared.token)&v=5.131").responseJSON { response in
            
            print(response.value!)
            
        }
}

func getUsersPhoto() {
    AF.request("https://api.vk.com/method/photos.get?album_id=profile&count=5&access_token=\(Session.shared.token)&v=5.131").responseJSON { response in
            
            print(response.value!)
            
        }
}

func getUsersGroups() {
    AF.request("https://api.vk.com/method/groups.get?count=5&access_token=\(Session.shared.token)&v=5.131").responseJSON { response in
            
            print(response.value!)
            
        }
}

func getGroupSearch() {
    AF.request("https://api.vk.com/method/groups.search?q=Playstation5&count=5&access_token=\(Session.shared.token)&v=5.131").responseJSON { response in
            
            print(response.value!)
            
        }
}
