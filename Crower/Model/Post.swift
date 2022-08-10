//
//  Post.swift
//  Crower
//
//  Created by Maria Letícia Dutra de Oliveira on 10/08/22.
//

import Foundation

struct Post: Codable {
    var id: UUID
    var content: String
    var userid: UUID
    var createdat: Date
    var updatedat: Date?
}
