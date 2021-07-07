//
//  Session.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 26.05.2021.
//

import UIKit

class Session: NSObject {
    
    static let shared = Session()
    
    private override init() {
        super.init()
    }
    
    var token: String = ""
    var userId: Int = 0
    
    
}

