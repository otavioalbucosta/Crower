//
//  User.swift
//  Crower
//
//  Created by Maria Letícia Dutra de Oliveira on 10/08/22.
//

import Foundation

struct User: Codable{
    var id: UUID
    var name: String
    var email: String
    var avatar: String?
    
    
}


#if DEBUG
extension User{
    static func mock() -> [User]{
        var users: [User] = []
        
        users.append(User(id: UUID(), name: "Leticia", email: "ldruta@gmail.com"))
        users.append(User(id: UUID(), name: "Otavio", email: "otavio@gmail.com"))
        users.append(User(id: UUID(), name: "Caio", email: "caio@gmail.com"))
        users.append(User(id: UUID(), name: "Lais", email: "lucas@gmail.com"))
        users.append(User(id: UUID(), name: "Leticia", email: "ldruta@gmail.com"))
        users.append(User(id: UUID(), name: "Otavio", email: "otavio@gmail.com"))
        users.append(User(id: UUID(), name: "Caio", email: "caio@gmail.com"))
        users.append(User(id: UUID(), name: "Lais", email: "lucas@gmail.com"))
        users.append(User(id: UUID(), name: "Leticia", email: "ldruta@gmail.com"))
        users.append(User(id: UUID(), name: "Otavio", email: "otavio@gmail.com"))
        users.append(User(id: UUID(), name: "Caio", email: "caio@gmail.com"))
        users.append(User(id: UUID(), name: "Lais", email: "lucas@gmail.com"))
        return users
    }
}

#endif
