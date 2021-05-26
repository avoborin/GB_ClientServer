//
//  FriendsTableViewCell.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 15.04.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var myBackView: UIView!
    
    
    var saveUser: User?
    var saveGroup: Group?
    
    func setupBackView () {
        myBackView.layer.cornerRadius = 30
        myBackView.layer.shadowColor = UIColor.black.cgColor
        myBackView.layer.shadowOffset = CGSize.zero
        myBackView.layer.shadowRadius = 5
        myBackView.layer.shadowOpacity = 0.9
    }
    
    
    func clearCell() {
        myImageView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
        saveUser = nil
        saveGroup = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackView()
        clearCell()
        // Initialization code
    }
    
    override func prepareForReuse() {
        clearCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
        }
    
//    func configureWithUser(user: User) {
//        for titlename in DataStorage.shared.usersArray {
//            if cell.titleLabel.text == titlename.name {
//                cell.descriptionLabel.text = String(titlename.age!)
//                cell.myImageView.image = titlename.avatar
//
//        titleLabel.text = user.name
//
//        if let age = user.age {
//            descriptionLabel.text = String(age) + " лет"
//        }
//
//        if let image = user.avatar {
//            myImageView.image = image
//            myImageView.layer.cornerRadius = 30
//        }
//        saveUser = user
//
//   }
    
    func configureWithGroup(group: Group) {
        titleLabel.text = group.name
        
        if let description = group.description {
            descriptionLabel.text = description
        }
        
        if let image = group.groupImage {
            myImageView.image = image
        }
        saveGroup = group
        
    }
    
}

