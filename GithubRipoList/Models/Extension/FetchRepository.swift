//
//  FetchRepository.swift
//  GithubRipoList
//
//  Created by onakama on 2022/09/24.
//

import Foundation

extension Response {
    
    public static func get() async throws -> Response {
        do {
            let responseData = try await fetch()
            return try decode(data: responseData)
        } catch let error{
            throw error
        }
    }
    
    private static func fetch() async throws -> Data{
        let url = URL(string: StaticURLs.githubAPI)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            guard let urlResponse = urlResponse as? HTTPURLResponse, urlResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            return data
        } catch let error{
            throw error
        }
    }
    
    private static func decode(data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedData = try decoder.decode(Response.self, from: data)
            return decodedData
        } catch let error {
            throw error
        }
    }
    
}
