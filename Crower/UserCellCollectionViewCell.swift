//
//  UserCellCollectionViewCell.swift
//  Crower
//
//  Created by Maria Letícia Dutra de Oliveira on 09/08/22.
//

import UIKit

class UserCellCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .yellow
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "TESTE TESTE"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
        
    }()
    
    func setupViews (){
        backgroundColor = .yellow
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 5).isActive = true
        
        
    
    }
    
}

