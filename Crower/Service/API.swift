//
//  API.swift
//  Crower
//
//  Created by Otávio Albuquerque on 10/08/22.
//

import Foundation


class API {
    
    
    static func getAllPosts() async -> [Post]{
        let link: String = "http://adaspace.local/posts"
        let request = URLRequest(url: URL(string: link)!)
        let decoder = JSONDecoder()
        let formatter = ISO8601DateFormatter()
        
        decoder.dateDecodingStrategy = .custom({ decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            if let date = formatter.date(from: dateString){
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "")
        })
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let postList = try decoder.decode([Post].self, from: data)
            return postList
        }catch {
            print(error)
            
        }
        return []

    }
    
    
    static func createUser(name: String, email: String, password: String) async -> Session?{
        let link = "http://adaspace.local/users"
        var request = URLRequest(url: URL(string: link)!)
        
        let body: [String:Any] = ["name": name,
                                  "email": email,
                                  "password": password
        ]
        
        request.httpMethod = "POST"
        let jsonBody = try? JSONSerialization.data(withJSONObject: body)
        
        request.httpBody = jsonBody
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        do {
            let (data,response) = try await URLSession.shared.data(for: request)
            let userData = try JSONDecoder().decode(Session.self, from: data)
            return userData
        }catch {
            print(error)
        }
        return nil
    }
}
