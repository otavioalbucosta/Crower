//
//  Router.swift
//  Crower
//
//  Created by Paulo Henrique Gomes da Silva on 30/10/22.
//

import Foundation

struct Router {
    var path: String
}

extension Router {
    var url: URL {
        var components = URLComponents()
        components.host = "adaspace.local"
        components.scheme = "http"
        components.path = "/" + path
        guard let url = components.url else {
            preconditionFailure("Invalid URL Components \(components)")
        }
        return url
    }
}
