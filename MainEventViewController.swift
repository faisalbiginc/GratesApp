//
//  MainEventViewController.swift
//  Grates
//
//  Created by Irtiza Mahmood on 8/25/16.
//  Copyright © 2016 Irtiza Mahmood. All rights reserved.
//

import UIKit

class MainEventViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
  //  @IBOutlet weak var messageImage: UIImageView!
    
    
    
    
    
    let hotEvents : [String] = ["Hot Event ONE", "Hot Event 2" , "Hot Event 3"]
     let featuredEvents : [String] = ["featured Event ONE", "featured Event 2" , "featuredEvent 3" , "featured Event four", "featured Event Five" , "featuredEvent 6"]
    
    @IBOutlet weak var eventSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableViewOfGratesEvents: UITableView!
    
    @IBAction func refreshButton(sender: AnyObject) {
        
        
    }
    
    @IBAction func segmentedControlActionChanged(sender: AnyObject) {
        
    tableViewOfGratesEvents.reloadData()
        
    }
    
    
    
    @IBAction func addGratesEvent(sender: UIBarButtonItem) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        tableViewOfGratesEvents.registerNib( UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: "EventCell")
        
       
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    
    
  
    
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
    
        return 10
    }
    

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell   {
    
        let cell = tableViewOfGratesEvents.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventsTableViewCell
    
    

    return cell
    
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }

// func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? // fixed font style. use custom view (UILabel) if you want something different   
// {}
//  
//     func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?   {}
//    
    
    
    
    
    
    
    


}














// Extra



//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//    }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//
//                return hotEvents.count
//    }
//
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell   {
//
//        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
//
//
//             cell.textLabel?.text = hotEvents[indexPath.row]
//
//        return cell
//
//    }





