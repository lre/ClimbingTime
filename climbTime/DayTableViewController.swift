//
//  DayTableViewController.swift
//  climbTime
//
//  Created by Lasse Reedtz on 18/09/14.
//  Copyright (c) 2014 LasseInc. All rights reserved.
//

import UIKit

class DayTableViewController: UITableViewController {
    
    let cellId = "daycell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.rowHeight = 75
        self.tableView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 200
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as DayTableViewCell
        
        var nextDate = NSTimeInterval(86400 * indexPath.row)
        var date = NSDate().dateByAddingTimeInterval(nextDate)
        
        var dateFormatter = NSDateFormatter()
        
        //Day
        dateFormatter.dateFormat = "EEE"
        var dayString = dateFormatter.stringFromDate(date)
        cell.Day.text = String(Array(dayString)[0]).uppercaseString + (dayString as NSString).substringWithRange(NSRange(location: 1,length: 2))
        
        //Date
        dateFormatter.dateFormat = "MMM d."
        var dateString : String = dateFormatter.stringFromDate(date)
        cell.Date.text = dateString
        
        
        
        // Configure the cell...
        return cell
    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var isSignedUp = (tableView.cellForRowAtIndexPath(indexPath) as DayTableViewCell).isSignedUp()
        
        var action : UITableViewRowAction
        
        if(!isSignedUp){
            action = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Add Me",
                handler:{
                    (action: UITableViewRowAction!, indexPath: NSIndexPath!)
                    in (tableView.cellForRowAtIndexPath(indexPath) as DayTableViewCell).signUp()
                    self.tableView.editing = false
                    return
            })
            
            action.backgroundColor = UIColor.greenColor();
            
        }
        else {
            action = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Remove Me",
                handler:{
                    (action: UITableViewRowAction!, indexPath: NSIndexPath!)
                    in (tableView.cellForRowAtIndexPath(indexPath) as DayTableViewCell).removeMe()
                    self.tableView.editing = false
                    return
            })
            
            action.backgroundColor = UIColor.redColor()
            
        }
        return [action]
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
