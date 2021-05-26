//
//  FotoCollectionViewController.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 15.04.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class FotoCollectionViewController: UICollectionViewController {
    
    var user: User?
    
    let fotoCollectionViewCellReuse = "FotoCollectionViewCell"
    
    var fotoArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "FotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: fotoCollectionViewCellReuse)
        
        guard let _ = user,
              let array = user?.fotoArray else {
            return
        }
        
        fotoArray = array
        //print(fotoArray)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fotoArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fotoCollectionViewCellReuse, for: indexPath) as? FotoCollectionViewCell else {return UICollectionViewCell()}
        
        cell.configure(image: fotoArray[indexPath.item])
    
        return cell
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    
}
//
//extension FotoCollectionViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: 150, height: 150)
//
//    }
//
//
//
//}
