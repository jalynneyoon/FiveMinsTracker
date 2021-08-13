//
//  Checklist.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/05.
//

import Foundation

struct Checklist : Identifiable {
    var id = UUID()
    var checklist_name : String
    var is_checked : Bool
    var habit_id = UUID()
}
