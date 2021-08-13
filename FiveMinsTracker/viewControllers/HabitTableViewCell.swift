//
//  HabitTableViewCell.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/07/23.
//

import UIKit

class HabitTableViewCell : UITableViewCell {
    

    
    @IBOutlet weak var habitNameLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    

    //    func initializeBtn() {
    //            self.frame = CGRect(x: 0.0, y: 0.0, width: 24, height: 24)
    //            self.setImage(UIImage(named:"left_image"), for: .normal)
    //
    //        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        // config setting code
        
        super.init(coder: aDecoder)
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}



