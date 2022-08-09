//
//  CollectionViewCell.swift
//  Crower
//
//  Created by Otávio Albuquerque on 09/08/22.
//

import UIKit

class WordCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .yellow
        setupViews()
    }
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "ALO 123"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        backgroundColor = .yellow
        
        addSubview(wordLabel)
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
}
