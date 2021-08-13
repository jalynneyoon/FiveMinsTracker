//
//  HttpClient.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/13.
//

import Foundation

class HttpClient {
    private let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func getJson(path: String, completed: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
           
            let fullPath = path.hasPrefix("http") ? path : self.baseUrl + path
            
            do {
                let url = URL(string: fullPath)
                let json = try String(contentsOf: url!, encoding: .utf8)
                DispatchQueue.main.async {
                    completed(Result.success(json))
                }
            } catch {
                DispatchQueue.main.async {
                    completed(Result.failure(error))
                }
            }
        }
    }
}
