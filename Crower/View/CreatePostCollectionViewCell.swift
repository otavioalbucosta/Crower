//
//  CreatePostCollectionViewCell.swift
//  Crower
//
//  Created by Otávio Albuquerque on 18/08/22.
//

import UIKit

class CreatePostCollectionViewCell: UICollectionViewCell, UITextViewDelegate {
    
    var postAction: (() -> Void)?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var postField: UITextView =  {
        
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .default
        field.keyboardType = .default
        field.text = "Em que você está pensando agora?"
        field.font = UIFont.systemFont(ofSize: 15)
        field.textColor = .lightGray
        field.backgroundColor = UIColor(red: 0.30, green: 0.45, blue: 0.71, alpha: 0)
        
        field.layer.cornerRadius = 20
       
//        field.attributedPlaceholder = NSAttributedString(string: "Em que você está pensando agora?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        
        
        let bottomLine = CALayer()
        
        
        bottomLine.frame = CGRect(x: 0, y: field.frame.height - 2, width: field.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.white.cgColor
      
        
        field.layer.addSublayer(bottomLine)
        
        return field
        
        
    }()
    
    lazy var postView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.30, green: 0.45, blue: 0.71, alpha: 0.2)
        view.layer.cornerRadius = 20
     
        return view
    
    
}()
    
    lazy var postButton: UIButton = {
        let button = UIButton()
        let twitterBlue = UIColor (red: 0.23, green: 0.65, blue: 0.95, alpha: 1)
        button.layer.cornerRadius = 5
        button.backgroundColor = twitterBlue
//        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.setTitle("Postar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(didSelectButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func didSelectButton() {
        postAction?()
    }
    
    func setupViews(){
        addSubview(postView)
        postView.addSubview(self.postField)
        postView.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            postView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            postView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            postView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
            
            postField.topAnchor.constraint(equalTo: postView.topAnchor, constant: 5),
            postField.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 10),
            postField.rightAnchor.constraint(equalTo: postView.rightAnchor, constant: -10),
            postField.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -50),
            
            postButton.topAnchor.constraint(equalTo: postField.bottomAnchor, constant: 0),
            postButton.rightAnchor.constraint(equalTo: postField.rightAnchor, constant: -10),
            postButton.widthAnchor.constraint(equalToConstant: 100),
            postButton.heightAnchor.constraint(equalToConstant: 40)
            
        
        ])
        
        print(postView.frame)
        postField.delegate = self
    
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.white
        }
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "O que você está pensando agora?"
            textView.textColor = UIColor.lightGray
        }
    }
}
