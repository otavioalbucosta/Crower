//
//  HomeController.swift
//  Crower
//
//  Created by Otávio Albuquerque on 09/08/22.
//

import Foundation
import UIKit


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cellId = "cellId"
    let headerId = "headerId"
    let footerId = "footerId"
    let mockUser = User.mock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        collectionView?.backgroundColor = .black
        
        collectionView?.register(UserCellCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(UserCellCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
//        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockUser.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserCellCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! UserCellCollectionViewCell
            header.nameLabel.text = mockUser[indexPath.row].name
            header.userNameLabel.text = mockUser[indexPath.row].email
            return header
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize (width: view.frame.width, height: 150)
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize (width: view.frame.width, height: 100)
//    }
}
