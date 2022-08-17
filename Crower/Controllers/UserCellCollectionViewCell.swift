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
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "corvinalovers"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
        
    }()
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@username"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let bioTextView: UITextView = {
//        let textView = UITextView()
//        textView.text = "fanclub ravenclawn brasil lorem  ipsum dolor aaaaaaaaa"
//        textView.backgroundColor = .black
//        textView.textColor = .white
//        textView.font = UIFont.systemFont(ofSize: 15)
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
    
    var followButton: UIButton = {
        let button = UIButton()
        let twitterBlue = UIColor (red: 0.23, green: 0.65, blue: 0.95, alpha: 1)
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        
        button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.setTitleColor(twitterBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(didSelectButton), for: .touchUpInside)
        
        return button
    }()
    
    func setupViews (){
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
//        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -12).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        userNameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
       
//
//        bioTextView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: -4).isActive = true
//        bioTextView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: -4).isActive = true
//        bioTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        bioTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        followButton.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
        //followButton.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        

        
        
    }
    
    @objc func didSelectButton(_ sender: Any) {
        
        Task{
            //let res = try await API.createUser(name: "Leticia", email: "Leticia@academy.com", password: "morango123")
            let res = try await API.login(username: "ldruta@gmail.com", password: "morango123")
            print(res)
            let ans = try await API.createpost(token: res!.token, content: "ola mundo")
            print(ans)

        }
        
    }
    
}

