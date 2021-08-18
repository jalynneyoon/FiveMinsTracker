//
//  ManageHabitViewModel.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/18.
//

import Foundation

class ManageHabitViewModel : NSObject {
    @IBOutlet var repository : FiveMinsRepository!
    
    let dummy: [String] = ["수학문제풀기", "아침조깅하기", "독서"]
    
    func countHabits() -> Int {
        return dummy.count
    }
    
    func showHabit(at idx: Int) -> String {
        return dummy[idx]
    }
    
}
