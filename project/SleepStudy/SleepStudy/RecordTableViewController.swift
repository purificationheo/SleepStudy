//
//  RecordTableViewController.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 1. 24..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {

    var selectedSubject:Subject?
    var isVisible:[Bool]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0...selectedSubject!.records.count-1{
            isVisible+=[false]
        }
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
        var count:Int = (selectedSubject?.records.count)!
        for i in 0...selectedSubject!.records.count-1{
            if isVisible[i]{
                let p:Record = (selectedSubject?.records[i])!
                count+=p.memos.count+1
            }
        }
        
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fileList", for: indexPath) as! ListTableViewCell

        
        // Configure the cell...
        
        let num = indexPath.row
        cell.listenImage.image = UIImage(named: "143-512")
        cell.dateLabel.text = (selectedSubject?.records[num].date)! + " 수업"
        cell.recordLength.text = "(" + (selectedSubject?.records[num].length)! + ")"

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let indexOfTappedRow = indexPath.row
        
        print(indexOfTappedRow)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
