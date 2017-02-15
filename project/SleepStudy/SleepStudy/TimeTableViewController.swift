//
//  TimeTableViewController.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 1. 24..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

/*var subjects:[Subject] = [Subject(name: "조직행동론",prof: "전재욱",place: "LP 504호",time:[(0,840,915),(2,840,915)]),
                          Subject(name: "네트워크",prof: "민성기",place: "정보관 202호",time:[(1,540,615),(3,540,615)]),
                          Subject(name: "교직실무",prof: "김재덕",place: "교욱관 203호",time:[(0,600,730),(4,600,730)])]*/
var subjects:[Subject] = []
var curClass:Subject?

var homeScene:UIViewController?

class TimeTableViewController: UITableViewController {

    //var subjects = Subject(name: "과목명", prof: "교수이름", place: "장소", time:[(day:0,startTime:0,endTime:0)])
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScene = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        //오늘이 무슨 요일인지?
        
        
        //월 : 0 화 : 1 수 : 2 목 : 3 금 : 4
        //subjects에 들어있는 항목 검사 -> 오늘 듣는 수업인지? 조건문
        
        
        //몇 개의 row를 사용할건지
        //월요일 -> 2를 return
        return subjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! TimeTableViewCell
        // Configure the cell...
        
        //위에서 선택한 과목을 각각 출력하는 부분
        let num = indexPath.row
        cell.subjectName.text = subjects[num].name
        cell.subjectPlace.text = subjects[num].place
        var str = ""
        for i in subjects[num].time{
            print(i)
            let day:String?
            switch i.day{
            case 0:
                day = "월"
                break
            case 1:
                day = "화"
                break
            case 2:
                day = "수"
                break
            case 3:
                day = "목"
                break
            case 4:
                day = "금"
                break
            default:
                day = ""
            }
            
            let startHour = i.startTime/60
            let startMinute = i.startTime%60
            let startIsPM = startHour/12
            
            let endHour = i.endTime/60
            let endMinute = i.endTime%60
            let endIsPM = endHour/12
            
            if str == ""{
                str += "\(day!)요일 \(startHour)시 \(startMinute)분 ~ \(endHour)시 \(endMinute)분"
            }else{
                str += " / \(day!)요일 \(startHour)시 \(startMinute)분 ~ \(endHour)시 \(endMinute)분"
            }
            
            
            
        }
        cell.subjectTime.text = str
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData() // No need for semicolon
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if let destVC = segue.destination as? RecordTableViewController{
            let selectedIndex = self.tableView.indexPathForSelectedRow?.row
            let selected = subjects[selectedIndex!]
        
            destVC.selectedIndex = selectedIndex
            destVC.selectedSubject = selected
        }
    }
}
 
