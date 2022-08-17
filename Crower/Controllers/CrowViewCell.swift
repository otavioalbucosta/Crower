//
//  CrowViewCell.swift
//  Crower
//
//  Created by Maria Letícia Dutra de Oliveira on 17/08/22.
//

import UIKit

class CrowViewCell: UICollectionViewCell {
    

        override init(frame: CGRect){
            super.init(frame: frame)
            backgroundColor = .red
            setupViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var texto: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam luctus mauris vitae eros ultrices, ut convallis augue eleifend. Sed iaculis augue in arcu mattis porta. Morbi tristique ut libero ut scelerisque. Nulla malesuada, felis in consequat interdum, est orci molestie metus, non aliquam purus est quis odio. Nam placerat lacinia urna at posuere. "
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.image = UIImage(named: "crow_icon")
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let crowtextview: UITextView = {
        let tv = UITextView ()
        
        let username = "user\n"
        let attributedtext = NSMutableAttributedString (string: username, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        let paragraphstyle = NSMutableParagraphStyle()
        paragraphstyle.lineSpacing = 4
        let range = NSMakeRange(0, attributedtext.string.count)
        attributedtext.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphstyle, range: range)
        
        attributedtext.append(NSAttributedString(string: texto, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
        
        tv.attributedText = attributedtext
        
     tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
        
    }()
    
    func setupViews(){
        
        addSubview(profileImageView)
        addSubview(crowtextview)
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        crowtextview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        crowtextview.leftAnchor.constraint(equalTo: profileImageView.rightAnchor).isActive = true
        crowtextview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        crowtextview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

