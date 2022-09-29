//
//  ViewModel.swift
//  GithubRipoList
//
//  Created by onakama on 2022/09/25.
//

import Foundation
import Combine

@MainActor //プロパティをメインスレッドからのみの変更できる保証。
final class ViewModel: ObservableObject {
    @Published var items: [Response.items] = []
    @Published private(set) var isLoading: Bool = false
    
    init() {
        Task {
            await getRepository()
        }
    }
    func getRepository() async {
        isLoading = true
        defer { isLoading = false }
        //mainスレッド
        do {
            items = try await Response.get().items
        } catch let error {
            print(error)
        }
    }
}
