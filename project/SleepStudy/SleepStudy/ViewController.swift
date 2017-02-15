//
//  ViewController.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 1. 18..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

       
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    }



extension Character {
    func unicodeScalarCodePoint() -> UInt32
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}
class Subject{
    
    
    
    var name:String = ""
    var id:String
    var prof:String = ""
    var place:String = ""
    
    var time:[(day:Int,startTime:Int,endTime:Int)]
    var records:Array<Record> = []
    
    init(name: String, prof: String, place: String, time:[(day:Int,startTime:Int,endTime:Int)]){
        self.name = name
        self.id = ""
        self.prof = prof
        self.place = place
        self.time = time
        self.tohex()
    }
    
    func tohex(){
        for i in self.name.characters{
            let temp = i.unicodeScalarCodePoint()
            self.id += String(format: "%2X", temp)
        }
        print("\(self.name):\(self.id)")
    }
}


class Memo{
    var content:String
    var type:String
    let time:Int
    
    init(content: String, type:String, time:Int){
        self.content = content
        self.type = type
        self.time = time
    }
}

class Capture{
    var path:String
    let time:Int
    
    init(path:String, time:Int){
        self.path = path
        self.time = time
    }
}

class Record{
    
    var path:URL
    var memos:Array<Memo>
    var captures:Array<Capture>
    let date:String
    let length:String
    
    init(path:URL, date:String, length:String){
        self.path = path
        self.date = date
        self.memos = []
        self.captures = []
        self.length = length
    }
}

class Setting{
    
    var password:Data
    var theme:String
    var memotypes:Array<String>
    
    init(){
        password = Data()
        theme = ""
        memotypes = []
    }
}

