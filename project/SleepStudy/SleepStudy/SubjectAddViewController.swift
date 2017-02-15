//
//  addSubjectViewController.swift
//  SleepStudy
//
//  Created by cscoi010 on 2017. 2. 15..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

class SubjectAddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    let timePicker = UIPickerView()
    let timePicker2 = UIPickerView()
    
    let pickerData = [["월","화","수","목","금"],["오전", "오후"],["1","2","3","4","5","6","7","8","9","10","11","12"],["0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"],["오전", "오후"],["0","1","2","3","4","5","6","7","8","9","10","11","12"],["0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]]

   
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var profText: UITextField!
    @IBOutlet weak var placeText: UITextField!
    @IBOutlet weak var timePickerText: UITextField!
    @IBOutlet weak var timePickerText2: UITextField!
    
      @IBAction func SaveButton(_ sender: Any) {
        
        var newSubject = Subject(name: "" , prof: "" , place: "" ,time: [(day:0,startTime:0,endTime:0)])
        
        newSubject.name = nameText.text!
        newSubject.prof = profText.text!
        newSubject.place = placeText.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        timePicker2.delegate = self
        timePicker2.dataSource = self
        
        timePickerText.inputView = timePicker
        timePickerText2.inputView = timePicker2
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 7
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return pickerData[component][row]
}
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
        inComponent component: Int)
    {
        if pickerView == timePicker {
        
        let day = pickerData[0][timePicker.selectedRow(inComponent: 0)]
        let ampm = pickerData[1][timePicker.selectedRow(inComponent: 1)]
        let starthour = pickerData[2][timePicker.selectedRow(inComponent: 2)]
        let startminute = pickerData[3][timePicker.selectedRow(inComponent: 3)]
        let ampm2 = pickerData[4][timePicker.selectedRow(inComponent: 4)]
        let endhour = pickerData[5][timePicker.selectedRow(inComponent: 5)]
        let endminute = pickerData[6][timePicker.selectedRow(inComponent: 6)]
        
       return timePickerText.text =  "\(day)요일  " + "\(ampm) " + " \(starthour)시  " + "\(startminute)분" + " ~ \(ampm2)  " + "\(endhour)시  " + "\(endminute)분"
            
        } else if pickerView == timePicker2 {
        let day = pickerData[0][timePicker2.selectedRow(inComponent: 0)]
        let ampm = pickerData[1][timePicker2.selectedRow(inComponent: 1)]
        let starthour = pickerData[2][timePicker2.selectedRow(inComponent: 2)]
        let startminute = pickerData[3][timePicker2.selectedRow(inComponent: 3)]
        let ampm2 = pickerData[4][timePicker2.selectedRow(inComponent: 4)]
        let endhour = pickerData[5][timePicker2.selectedRow(inComponent: 5)]
        let endminute = pickerData[6][timePicker2.selectedRow(inComponent: 6)]
        
       return timePickerText2.text =  "\(day)요일  " + "\(ampm) " + " \(starthour)시  " + "\(startminute)분" + " ~ \(ampm2)  " + "\(endhour)시  " + "\(endminute)분"
    }
        
    }
    
           // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
}

}
