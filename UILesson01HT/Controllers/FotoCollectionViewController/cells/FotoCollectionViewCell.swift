//
//  FotoCollectionViewCell.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 15.04.2021.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fotoImage: UIImageView!
    @IBOutlet weak var likeCountTitle: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var cellBack: UIView!
    
    
    var savedImage: UIImage?
    
    
    func clearCell() {
        fotoImage.image = nil
        savedImage = nil
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeCountTitle.text = String(0)
        clearCell()
        cellBack.backgroundColor = UIColor.systemGray6
    }
    
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configure(image: UIImage) {
        fotoImage.image = image
        savedImage = image
        
        //Позволяет вписать картинку в экран
        fotoImage.translatesAutoresizingMaskIntoConstraints = true
        
    }
    
    @IBAction func pressLikeButton (_ sender: UIButton) {
      if sender.isSelected == false {
        sender.isSelected = true

        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "isSelected\(sender.tag)")
        likeCountTitle.text = String(1)
      }
      else {
        sender.isSelected = false
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "isSelected\(sender.tag)")
        likeCountTitle.text = String(0)
      }
        
    }
    
}
