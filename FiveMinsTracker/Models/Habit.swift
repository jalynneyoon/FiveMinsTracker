//
//  Habit.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/05.
//

import Foundation


struct Habit : Identifiable {
    var id = UUID()
    var habit_name : String
    var alarm_time : Date
    var makepublic : Bool
    var user_id : UUID = UUID()
}
