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
        if subjects.count>0{
            curClass = subjects[0]
        }
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
class Subject:NSObject, NSCoding{
    
    
    
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
        super.init()
        self.tohex()
    }
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        id = aDecoder.decodeObject(forKey: "id") as? String ?? ""
        prof = aDecoder.decodeObject(forKey: "prof") as? String ?? ""
        place = aDecoder.decodeObject(forKey: "place") as? String ?? ""
        
        let num = aDecoder.decodeObject(forKey: "num") as? Int ?? 0
        time = []
        for i in 0...num{
            let day = aDecoder.decodeObject(forKey: "time\(i).day") as? Int ?? -1
            let startTime = aDecoder.decodeObject(forKey: "time\(i).startTime") as? Int ?? -1
            let endTime = aDecoder.decodeObject(forKey: "time\(i).endTime") as? Int ?? -1
            let temp:[(day:Int,startTime:Int,endTime:Int)] = [(day,startTime,endTime)]
            time+=temp
        }
        time = aDecoder.decodeObject(forKey: "time") as? [(Int,Int,Int)] ?? [(0,0,0)]
        records = aDecoder.decodeObject(forKey: "records") as? [Record] ?? []
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(prof, forKey: "prof")
        aCoder.encode(place, forKey: "place")
        aCoder.encode(time.count, forKey: "num")
        var count=0
        for i in time{
            aCoder.encode(i.day, forKey: "time\(count).day")
            aCoder.encode(i.startTime, forKey: "time\(count).startTime")
            aCoder.encode(i.endTime, forKey: "time\(count).endTime")
            count+=1
        }
        aCoder.encode(records, forKey: "records")
    }
    
    func tohex(){
        for i in self.name.characters{
            let temp = i.unicodeScalarCodePoint()
            self.id += String(format: "%2X", temp)
        }
        print("\(self.name):\(self.id)")
    }
}


class Memo:NSObject, NSCoding{
    var content:String
    var type:String
    let time:Int
    
    init(content: String, type:String, time:Int){
        self.content = content
        self.type = type
        self.time = time
    }
    required init(coder aDecoder: NSCoder) {
        content = aDecoder.decodeObject(forKey: "content") as? String ?? ""
        type = aDecoder.decodeObject(forKey: "type") as? String ?? ""
        time = aDecoder.decodeObject(forKey: "time") as? Int ?? 0
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(content, forKey: "content")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(time, forKey: "time")
    }
}

class Capture:NSObject, NSCoding{
    var path:String
    let time:Int
    
    init(path:String, time:Int){
        self.path = path
        self.time = time
    }
    
    required init(coder aDecoder: NSCoder) {
        path = aDecoder.decodeObject(forKey: "path") as? String ?? ""
        time = aDecoder.decodeObject(forKey: "time") as? Int ?? 0
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(path, forKey: "path")
        aCoder.encode(time, forKey: "time")
    }
}

class Record:NSObject, NSCoding{
    
    var path:URL
    var memos:Array<Memo>
    var captures:Array<Capture>
    let date:String
    var length:String
    
    init(path:URL, date:String, length:String){
        self.path = path
        self.date = date
        self.memos = []
        self.captures = []
        self.length = length
    }
    
    required init(coder aDecoder: NSCoder) {
        path = aDecoder.decodeObject(forKey: "path") as? URL ?? URL(string:"")!
        memos = aDecoder.decodeObject(forKey: "memos") as? [Memo] ?? []
        captures = aDecoder.decodeObject(forKey: "captures") as? [Capture] ?? []
        date = aDecoder.decodeObject(forKey: "date") as? String ?? ""
        length = aDecoder.decodeObject(forKey: "length") as? String ?? ""
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(path, forKey: "path")
        aCoder.encode(memos, forKey: "memos")
        aCoder.encode(captures, forKey: "captures")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(length, forKey: "length")
    }
}

class Setting:NSObject, NSCoding{
    
    var password:Data
    var theme:String
    var memotypes:Array<String>
    
    override init(){
        password = Data()
        theme = ""
        memotypes = []
    }
    
    required init(coder aDecoder: NSCoder) {
        password = aDecoder.decodeObject(forKey: "password") as? Data ?? Data()
        theme = aDecoder.decodeObject(forKey: "theme") as? String ?? ""
        memotypes = aDecoder.decodeObject(forKey: "memotypes") as? [String] ?? []
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(password, forKey: "password")
        aCoder.encode(theme, forKey: "theme")
        aCoder.encode(memotypes, forKey: "memotypes")
    }
}

