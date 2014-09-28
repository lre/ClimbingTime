//
//  DayTableViewController.swift
//  climbTime
//
//  Created by Lasse Reedtz on 18/09/14.
//  Copyright (c) 2014 LasseInc. All rights reserved.
//

import UIKit

class DayTableViewController: UITableViewController, DatahandlerDelegate{
    
    let cellId = "daycell"
    var selfie = ""
    
    @IBOutlet weak var activ: UIActivityIndicatorView!
    var atendMap : [String : Array<String>] = ["" : [""]]
    var myDates = NSMutableSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.hidden = true
        self.activ.hidden = false
        self.activ.startAnimating()
        let dataHandler = Datahandler()
        
        dataHandler.delegate = self
        dataHandler.getdata()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.rowHeight = 75
        self.tableView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    func loginRequired(){
        
    }
    
    func dataAvalible(atendMap : [String : Array<String>], mydata : NSMutableSet){
        self.atendMap = atendMap
        self.myDates = mydata
        
        self.activ.stopAnimating()
        self.activ.hidden = true
        
        self.tableView.hidden = false
        self.tableView.reloadData()
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
        
        cell.clear()
        
        var nextDate = NSTimeInterval(86400 * indexPath.row)
        var date = NSDate().dateByAddingTimeInterval(nextDate)
        
        cell.setDate(date)
        
        if let imageArray = self.atendMap[cell.dateID]{
            for imageFileName in imageArray{
                cell.addImage(UIImage(named: imageFileName))
            }
        }
        
        if self.myDates.containsObject(cell.dateID){
            cell.signedUp = true
            cell.addMyImage(UIImage(named: self.selfie))
        }
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
                    in (tableView.cellForRowAtIndexPath(indexPath) as DayTableViewCell).signUp( UIImage(named: self.selfie) )
                    self.addMe(indexPath)
                    return
            })
            
            action.backgroundColor = UIColor.greenColor();
            
        }
        else {
            action = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Remove Me",
                handler:{
                    (action: UITableViewRowAction!, indexPath: NSIndexPath!)
                    in (tableView.cellForRowAtIndexPath(indexPath) as DayTableViewCell).removeMe()
                    self.removeMe(indexPath)
                    return
            })
            
            action.backgroundColor = UIColor.redColor()
            
        }
        return [action]
    }
    
    private func arrayRemovingObject<T : Equatable>(object: T, fromArray array: [T]) -> [T] {
        var index = find(array, object)
        
        var a = array
        if ((index) != nil){
            a.removeAtIndex(index!)
        }
        
        return a
    }
    
    private func addMe (indexPath : NSIndexPath) {
        //Get the date
        var dateKey : String = (tableView.cellForRowAtIndexPath(indexPath) as DayTableViewCell).dateID
        
        self.myDates.addObject(dateKey)
        
        self.tableView.editing = false
    }
    
    private func removeMe (indexPath : NSIndexPath) {
        //Get the date
        var dateKey : String = (tableView.cellForRowAtIndexPath(indexPath) as DayTableViewCell).dateID
        
        self.myDates.removeObject(dateKey)
        
        self.tableView.editing = false
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
}
