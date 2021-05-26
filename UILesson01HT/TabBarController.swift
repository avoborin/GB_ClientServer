//
//  TabBarController.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 15.04.2021.
//

import UIKit

class TabBarController: UITabBarController {

    func fillUsersArray() {
        
        let user1 = createNewUser(userNumber: 1, name: "Valentin", age: 30)
        let user2 = createNewUser(userNumber: 2, name: "Denis", age: 32)
        let user3 = createNewUser(userNumber: 3, name: "Anna", age: 20)
        let user4 = createNewUser(userNumber: 4, name: "Nikolay", age: 40)
        let user5 = createNewUser(userNumber: 5, name: "Viktoriya", age: 25)
        let user6 = createNewUser(userNumber: 6, name: "Michael", age: 27)
        let user7 = createNewUser(userNumber: 7, name: "Ded", age: 80)
        let user8 = createNewUser(userNumber: 8, name: "Grunny", age: 79)
        
        let userArray = [user1, user2, user3, user4, user5, user6, user7, user8]
        
        
        var namesArray: [String] = []
        for name in userArray {
            namesArray.append(name.name)
        }

        
        //print(userArray)
        
        let group1 = Group(name: "Олды тут", description: "В бой идут старики", groupImage: UIImage(named: "oldshere"))
        let group2 = Group(name: "Мамочки", description: "Собираемся с колясками у подъезда", groupImage: UIImage(named: "moms"))
        let group3 = Group(name: "Гараж мужика", description: "Гараж курильщика", groupImage: UIImage(named: "mansgarage"))
        let group4 = Group(name: "Усы лапы хвост", description: "Просто котики", groupImage: UIImage(named: "cat"))

        let groupArray = [group1, group2, group3, group4]
        
        //print(groupArray)
        
        DataStorage.shared.usersArray = userArray
        DataStorage.shared.allGroup = groupArray
        DataStorage.shared.namesArray = namesArray
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUsersArray()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
