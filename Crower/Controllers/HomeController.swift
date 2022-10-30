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
    let registerId = "registerId"
    var users = [User]()
    var posts = [Post]()
    var content: String?
    var session: Session?
    var mainColor: UIColor = UIColor(red: 0.05, green: 0.04, blue: 0.18, alpha: 1.00)
    var secondaryColor: UIColor = UIColor(red: 0.30, green: 0.45, blue: 0.71, alpha: 1.00)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.barTintColor = secondaryColor
        let app = UINavigationBarAppearance()
        app.shadowColor = .clear
        app.configureWithDefaultBackground()
        app.backgroundColor = secondaryColor
        navigationItem.scrollEdgeAppearance = app
        navigationItem.standardAppearance = app
        tabBarController?.tabBar.barTintColor = secondaryColor

        
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
//    var floatButton: UIButton = {
//        var button = UIButton()
//        button.layer.cornerRadius = 25
//        button.backgroundColor = UIColor (red: 0.23, green: 0.65, blue: 0.95, alpha: 1)
//        button.setImage(UIImage(systemName: "plus"), for: .normal)
//        button.imageView?.tintColor = .white
//        button.setTitleColor(.black, for: .normal)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardOnTap()
        navigationItem.hidesBackButton = true
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionHeadersPinToVisibleBounds = true
        collectionView?.backgroundColor = mainColor
        
        collectionView?.register(CrowViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(UserCellCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(CreatePostCollectionViewCell.self, forCellWithReuseIdentifier: registerId)
        Task{
            let res = await API.getAllPosts()
            let ans = await API().getAllUsers()
            self.posts = res
            self.users = ans
            self.collectionView.reloadData()
        }
//        self.posts = Post.mock()
//        view.addSubview(floatButton)
//        
//        
//        floatButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        floatButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        floatButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//        floatButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count + 1
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: registerId, for: indexPath) as! CreatePostCollectionViewCell
            cell.postAction = { [self] in
                Task{
                    let res = try await API.createpost(token: session!.token, content: cell.postField.text)
                    if let res = res {
                        DispatchQueue.main.async {
                            self.posts.insert(res, at: 0)
                            self.collectionView.reloadData()
                            cell.postField.text = ""
                        }
                    }
                }
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CrowViewCell
        cell.username = self.users.filter({$0.id == self.posts[indexPath.row - 1].userid})[0].name
        cell.texto = self.posts[indexPath.row - 1].content
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize (width: view.frame.width, height: 170)
        }
        
        let aproximatedWidthOfBiotextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: aproximatedWidthOfBiotextView, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: posts[indexPath.row - 1].content).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return CGSize(width: view.frame.width, height: estimatedFrame.height + 80)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! UserCellCollectionViewCell
        header.nameLabel.text = session?.user.name
        header.userNameLabel.text = session?.user.email
        
        header.followButton.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        
        header.backgroundColor = secondaryColor
            return header
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize (width: view.frame.width, height: 70)
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize (width: view.frame.width, height: 100)
//    }
    
    @objc func logoutAction() {
        Task{
            do{
            try await API.logout(token:session!.token)
            }catch{}
            
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    func setupHideKeyboardOnTap() {
            self.view.addGestureRecognizer(self.endEditingRecognizer())
            self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
        }

        /// Dismisses the keyboard from self.view
        private func endEditingRecognizer() -> UIGestureRecognizer {
            let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
            tap.cancelsTouchesInView = false
            return tap
        }
    
    
}

