//
//  ViewController.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 1. 18..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate {

    var picker:UIImagePickerController?=UIImagePickerController()
    
    @IBOutlet weak var imgaeView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker?.delegate=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TakePhoto(_ sender: Any) {
        openCamera ()
    }
    
    func openCamera(){
        
    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
    picker!.allowsEditing = false
    picker!.sourceType = UIImagePickerControllerSourceType.camera
    picker!.cameraCaptureMode = .photo
    present(picker!, animated: true, completion: nil)
    }else{
    let alert = UIAlertController(title: "Camera Not Found", message: "This device has no Camera", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
    alert.addAction(ok)
    present(alert, animated: true, completion: nil)
    }
    
    }
}



class Subject{
    
    
    
    var name:String = ""
    var prof:String = ""
    var place:String = ""
    
    var time:[(day:Int,startTime:Int,endTime:Int)]
    var records:Array<Record> = []
    
    init(name: String, prof: String, place: String, time:[(day:Int,startTime:Int,endTime:Int)]){
        self.name = name
        self.prof = prof
        self.place = place
        self.time = time
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
    
    var path:String
    var memos:Array<Memo>
    var captures:Array<Capture>
    let date:String
    
    init(path:String, date:String){
        self.path = path
        self.date = date
        self.memos = []
        self.captures = []
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
