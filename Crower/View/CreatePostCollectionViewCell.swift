//
//  CreatePostCollectionViewCell.swift
//  Crower
//
//  Created by Otávio Albuquerque on 18/08/22.
//

import UIKit

class CreatePostCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect){
        super.init(frame: frame)
//        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var postField: UITextField =  {
        let field = UITextField()
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: field.frame.height - 2, width: field.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.white.cgColor
        field.borderStyle = .none
        
        field.layer.addSublayer(bottomLine)
        
        return field
        
    }()
    
}
