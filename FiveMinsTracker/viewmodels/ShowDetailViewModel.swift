//
//  EditHabitViewModel.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/08/18.
//

import Foundation

class ShowDetailViewModel: NSObject {
    @IBOutlet var repository : FiveMinsRepository!
    
    // 더미데이터니까 일단 여기에 두자.
    var habitName : String =
        "독서하기"
    // override func prepare(for segue: UIStoryboardSegue, sender: Any?에서 가져오기

    var checkList : [String] = [
        "총균쇠 마저 읽고 독후감쓰기",
        "아침에 자기계발서 2쪽 읽기",
        "백년동안의 고독 읽기"
    ]
    
    var todosInFiveMins : [String] = [
        "카페로 나가기",
        "이북 집어들기",
        "책 집어들고 안락의자로 가기",
        "독서노트 다시 읽어보기"
    ]
    
    func getHabitName() -> String {
        return habitName
    }
    
    func countNumOfChecklist() -> Int {
        return checkList.count
    }
    
    func countNumOfFiveMinsTodo() -> Int {
        return todosInFiveMins.count
    }
    
    func checklist(at idx : Int) -> String {
        return checkList[idx]
    }
    
    func todoInFiveMins(at idx: Int) -> String {
        return todosInFiveMins[idx]
    }
 
}
