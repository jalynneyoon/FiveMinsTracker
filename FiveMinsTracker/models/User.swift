//
//  User.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/05.
//

import Foundation


struct User : Identifiable {
    var id : UUID
    var nickname : String
    var login : Bool
    
    
    init(id: UUID, nickname: String, login: Bool){
        self.id = id
        self.nickname = nickname
        self.login = login
    }
}
