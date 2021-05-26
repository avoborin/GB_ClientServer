//
//  DataStorage.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 15.04.2021.
//

import UIKit

class DataStorage: NSObject {
    static let shared = DataStorage()
    private override init() {
        super.init()
    }
    
    var usersArray = [User]()
    var namesArray = [String]()
    
    var allGroup = [Group]()
    var myFavoriteGroup = [Group]()
}
