//
//  FriendsTableViewController.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 15.04.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var userDictionary = [String: [String]]()
    var userSectionTitles = [String]()
    
    let friendsTableViewCellReuse = "FriendsTableViewCell"
    let fromFriendsToFotoSegue = "fromFriendsToFoto"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: friendsTableViewCellReuse)
        
        for user in DataStorage.shared.usersArray {
            let userKey = String(user.name.prefix(1))
            if var userValues = userDictionary[userKey] {
                userValues.append(user.name)
                userDictionary[userKey] = userValues
                //print(userDictionary[userKey]!)
            } else {
                userDictionary[userKey] = [user.name]
            }
        }

        userSectionTitles = [String](userDictionary.keys)
        userSectionTitles = userSectionTitles.sorted(by: {$0 < $1})
        
        print(userSectionTitles)
        print(userDictionary)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return userSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let userKey = userSectionTitles[section]
        if let userValues = userDictionary[userKey] {
            return userValues.count
        }
        
        return 0
        

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsTableViewCellReuse, for: indexPath) as?
                FriendsTableViewCell else {return UITableViewCell()}
        
        let userKey = userSectionTitles[indexPath.section]
        if let userValues = userDictionary[userKey] {
            cell.titleLabel.text = userValues[indexPath.row]
            
            for titlename in DataStorage.shared.usersArray {
                if cell.titleLabel.text == titlename.name {
                    cell.descriptionLabel.text = String(titlename.age!)
                    cell.myImageView.image = titlename.avatar
                    cell.myImageView.layer.cornerRadius = 30
                    cell.saveUser = titlename
                }
            }
        }
 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToFotoSegue {
            guard let user = sender as? User,
                  let destination = segue.destination as? FotoCollectionViewController
            else {return}
            destination.user = user
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell,
              let user = cell.saveUser
        else {return}
        
        performSegue(withIdentifier: fromFriendsToFotoSegue, sender: user)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return userSectionTitles
    }
   
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

