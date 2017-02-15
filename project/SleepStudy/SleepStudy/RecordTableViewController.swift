//
//  RecordTableViewController.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 1. 24..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {

    var selectedIndex:Int?
    var selectedSubject:Subject?
    
    @IBOutlet weak var navi: UINavigationItem!

    var cellOrder : [(Int,Int,Int)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navi.title = selectedSubject?.name
        self.tableView.separatorColor = UIColor.clear
        if let subject = selectedSubject{
            for i in 0..<subject.records.count{
                cellOrder.append((0,i,0))
                for j in 0..<subject.records[i].memos.count{
                    cellOrder.append((1,i,j))
                }
                for j in 0..<subject.records[i].captures.count{
                    cellOrder.append((2,i,j))
                }
            }
        }
        cellOrder.append((3,0,0))
        print(cellOrder.count)
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
        return cellOrder.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let num = indexPath.row
        
        let output = cellOrder[num]
        
        switch output.0 {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fileList", for: indexPath) as! ListTableViewCell
            
            
            // Configure the cell...
            
            cell.listenImage.image = UIImage(named: "143-512")
            cell.dateLabel.text = (selectedSubject?.records[output.1].date)! + " 수업"
            cell.recordLength.text = "(" + (selectedSubject?.records[output.1].length)! + ")"
            cell.selectedRecord = selectedSubject?.records[output.1]
            cell.playProgress.progress=0
            cell.nowTime.text="00:00:00"
            cell.endTime.text="00:00:00"
            
            
            return cell
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "memoList", for: indexPath) as! ListTableViewCell
            cell2.memoLabel.text = selectedSubject?.records[output.1].memos[output.2].content
            
            return cell2
            
        case 2:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "pictureList",for: indexPath) as! ListTableViewCell
            cell3.captureImage.image=UIImage(contentsOfFile: (selectedSubject?.records[output.1].captures[output.2].path)!)
            
            return cell3
        case 3:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "bottomCell",for: indexPath) as! ListTableViewCell
            return cell4
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoList", for: indexPath)
            
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let num = indexPath.row
        let output = cellOrder[num]
        
        switch output.0{
        case 0:
            return 170.0
        case 1:
            return 45.0
        default:
            return 45.0
        }
        //Choose your custom row height
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let num = indexPath.row
            let output = cellOrder[num]
            //tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            switch output.0{
            case 0:
                for i in num...cellOrder.count-1{
                    if cellOrder[i].1 == output.1{
                        //tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                    }
                }
                selectedSubject?.records.remove(at: output.1)
                break
            case 1:
                selectedSubject?.records[output.1].memos.remove(at: output.2)
                break
            case 2:
                selectedSubject?.records[output.1].captures.remove(at:output.2)
                break;
            default : break
            }
            cellOrder = []
            if let subject = selectedSubject{
                for i in 0..<subject.records.count{
                    cellOrder.append((0,i,0))
                    for j in 0..<subject.records[i].memos.count{
                        cellOrder.append((1,i,j))
                    }
                    for j in 0..<subject.records[i].captures.count{
                        cellOrder.append((2,i,j))
                    }
                }
            }
            cellOrder.append((3,0,0))
            print(cellOrder.count)
            tableView.reloadData()
            saveData()
        }
    }
    
    @IBAction func deleteSubject(_ sender: Any) {
        subjects.remove(at: selectedIndex!)
        navigationBack(homeScene!)
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
