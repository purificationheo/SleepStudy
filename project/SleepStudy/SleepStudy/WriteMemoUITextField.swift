//
//  WriteMemoUITextField.swift
//  SleepStudy
//
//  Created by cscoi010 on 2017. 2. 1..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

class WriteMemoUITextField: UITextField {
    
    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    let documentsDirectory: AnyObject = paths[0]
    let dataPath = documentsDirectory.appendingPathComponent("MyFolder")!
    
    do {
    try FileManager.default.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: false, attributes: nil)
    } catch let error as NSError {
    print(error.localizedDescription) }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
