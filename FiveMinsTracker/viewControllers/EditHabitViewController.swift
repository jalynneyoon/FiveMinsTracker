//
//  EditHabitViewController.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/07/26.
//

import UIKit

class EditHabitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //  습관편집에서 제목/타이머시작/체크리스트지우기/습관편집 및 삭제

    @IBOutlet weak var tableView : UITableView!
    
    let sectionHeader : [String] = [
        "습관",
        "체크리스트",
        "5분 동안 할일",
        "5분 타이머",
        "습관 관리"
    ]
    var habitName : [String] = [
        "독서하기" // override func prepare(for segue: UIStoryboardSegue, sender: Any?에서 가져오기
    ]
    
    var checkList : [String] = [
        "총균쇠 마저 읽고 독후감쓰기",
        "아침에 자기계발서 2쪽 읽기",
        "백년동안의 고독 읽기"
    ]
    
    var todoInFiveMins : [String] = [
        "카페로 나가기",
        "이북 집어들기",
        "책 집어들고 안락의자로 가기",
        "독서노트 다시 읽어보기"
    ]
    
    let manageCurrentHabit : [String] = [
        "습관 삭제하기",
        "습관 편집하기"
    ]
    
    // tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:     // 습관이름
            return 1
        case 1:     //체크리스트
            return checkList.count
        case 2:     // 5분 동안 할 일
            return todoInFiveMins.count
        case 3:     // 5분 타이머
            return 1
        case 4:     // 습관관리(습관삭제, 습관편집하기)
            return manageCurrentHabit.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell" , for: indexPath)
        
        var text : String {
            if indexPath.section == 0 {
                return habitName[indexPath.row]
            }
            else if indexPath.section  == 1 {
                return checkList[indexPath.row]
            }
            else if indexPath.section == 2 {
                return todoInFiveMins[indexPath.row]
            }
            else if indexPath.section == 3 {
                return "타이머시작"
            }
            else if indexPath.section == 4 {
                return manageCurrentHabit[indexPath.row]
            }
            else {
                return "default"
            }
        }
        cell.textLabel?.text = text  // 셀에 표현될 데이터
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 3 {
            performSegue(withIdentifier: "TimerSegue", sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
