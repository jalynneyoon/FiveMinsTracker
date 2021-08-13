//
//  FiveMinsTrackerRepository.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/13.
//

import Foundation

class FiveMinsRepository: NSObject {
    

    private let httpClient = HttpClient(baseUrl: " http://127.0.0.1:8080" )
    //" http://127.0.0.1:8080"
    // "https://five-mins-tracker.herokuapp.com"
    
    func getuserInfo(completed: @escaping (User) -> Void) {
        httpClient.getJson(path: "/user/0BC07616-C15B-4529-82AB-F003D50F5009") { result in
            if let json = try? result.get() {
                completed(self.parseUser(jsonObject: self.JSONObject(json)))
            }
        }
    }



    private func JSONObject(_ json: String) -> [String: Any] {
        let data = json.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        return jsonObject
    }

  
    private func parseUser (jsonObject: [String: Any]) -> User {
        return User(id: jsonObject["id"] as! UUID,
                       nickname: jsonObject["nickname"] as! String,
                       login: jsonObject["login"] as! Bool)
//                       start: DateUtil.parseDate(jsonObject["start"] as! String),
//                       end: DateUtil.parseDate(jsonObject["end"] as! String),
    
    }
}
