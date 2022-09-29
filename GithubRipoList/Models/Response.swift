//
//  Response.swift
//  GithubRipoList
//
//  Created by onakama on 2022/09/24.
//

import Foundation

struct Response: Codable, Equatable, Sendable {
    let items: [items]
    
    private init(items: [items]) {
        self.items = items
    }
    struct items: Identifiable, Codable, Equatable {
        let id: Int
        let owner: Owner
        let description: String?
    
        private init(id: Int, owner: Owner, description: String?) {
            self.id = id
            self.owner = owner
            self.description = description
        }
    }
    
}
