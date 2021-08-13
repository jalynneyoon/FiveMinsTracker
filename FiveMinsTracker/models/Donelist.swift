//
//  Donelist.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/05.
//

import Foundation

struct Donelist : Identifiable {
    var id = UUID()
    var done_date = Date()
    var short_description : String
    var habit_id = UUID()
}
