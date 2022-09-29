//
//  Owner.swift
//  GithubRipoList
//
//  Created by onakama on 2022/09/24.
//

import Foundation
struct Owner: Codable, Equatable, Sendable {
    let login: String
    let avatar_url: String?
}
