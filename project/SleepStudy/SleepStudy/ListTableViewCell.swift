//
//  ListTableViewCell.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 2. 6..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit
import AVFoundation

class ListTableViewCell: UITableViewCell {
    
    var selectedRecord:Record?

    @IBOutlet weak var listenImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var checkBox: UIImageView!
    @IBOutlet weak var recordLength: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func touchButton(_ sender: UIButton) {
        playSound()
    }
    var player: AVAudioPlayer?
    func playSound() {

        let url = selectedRecord?.path
        print(url!)
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
