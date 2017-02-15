//
//  TimeTableViewCell.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 2. 15..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectName: UILabel!
    
    @IBOutlet weak var subjectTime: UILabel!
    
    @IBOutlet weak var subjectPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
