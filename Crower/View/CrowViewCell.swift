//
//  CrowViewCell.swift
//  Crower
//
//  Created by Maria Letícia Dutra de Oliveira on 17/08/22.
//

import UIKit

class CrowViewCell: UICollectionViewCell {
    
    var texto: String? = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam luctus mauris vitae eros ultrices, ut convallis augue eleifend. Sed iaculis augue in arcu mattis porta. Morbi tristique ut libero ut scelerisque. Nulla malesuada, felis in consequat interdum, est orci molestie metus, non aliquam purus est quis odio. Nam placerat lacinia urna at posuere. " {
        didSet {
            setupText()
        }
    }
    var username: String? = "user" {
        didSet {
            setupText()
        }
    }
        override init(frame: CGRect){
            super.init(frame: frame)
            backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.18, alpha: 1.00)

            setupViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var profileImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.image = UIImage(named: "crow_icon")
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.18, alpha: 1.00)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var crowtextview: UITextView = {
        let tv = UITextView ()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor(red: 0.30, green: 0.45, blue: 0.71, alpha: 0.4)
        tv.isUserInteractionEnabled = false
        tv.clipsToBounds = true
        tv.layer.cornerCurve = .continuous
        tv.layer.cornerRadius = 20
   
    
        return tv
        
    }()
    
    func setupViews(){
        
        addSubview(profileImageView)
        addSubview(crowtextview)
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        crowtextview.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        crowtextview.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10).isActive = true
        crowtextview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        crowtextview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        setupText()
        
        
        
        
    }
    func setupText() {
        let attributedtext = NSMutableAttributedString (string: "\(username!)\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        let paragraphstyle = NSMutableParagraphStyle()
        paragraphstyle.lineSpacing = 4
        let range = NSMakeRange(0, attributedtext.string.count)
        attributedtext.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphstyle, range: range)
        
        attributedtext.append(NSAttributedString(string: texto!, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        crowtextview.attributedText = attributedtext
    }
}

