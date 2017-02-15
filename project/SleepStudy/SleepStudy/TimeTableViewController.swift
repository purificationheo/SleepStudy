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
 
