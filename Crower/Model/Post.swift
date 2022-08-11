//
//  Post.swift
//  Crower
//
//  Created by Maria Letícia Dutra de Oliveira on 10/08/22.
//

import Foundation

struct Post: Codable {
    let id: UUID
    let content: String
    let userid: UUID
    let createdat: Date
    let updatedat: Date?
    
    enum CodingKeys: String, CodingKey {
        case id, content
        case userid = "user_id"
        case createdat = "created_at"
        case updatedat = "updated_at"
    }
}
