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
    var avatar: String
}
