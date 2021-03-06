//
//  ManageHabitViewController.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/07/23.
//

import UIKit

class ManageHabitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var viewModel : ManageHabitViewModel!
    @IBOutlet weak var tableView : UITableView!

    
    // tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countHabits()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTableViewCell
        
        let data = viewModel.showHabit(at: indexPath.row)
        
        cell.cellView.layer.cornerRadius = 10
        cell.habitNameLabel?.text = data
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     */
    
}
