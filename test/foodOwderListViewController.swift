//
//  foodOwderListViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class foodOwderListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var owderFoodList = []
    var owderFoodMany = []
    var a = 0
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        var ud = NSUserDefaults.standardUserDefaults()
        a = appDelegate.guestNumber
        if ud.objectForKey("guest\(a)") != nil {
            owderFoodList = ud.objectForKey("guest\(a)") as! NSArray
        }
        print(owderFoodList)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        owderFoodList.delete(indexPath.row)
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var ud = NSUserDefaults.standardUserDefaults()
        if ud.objectForKey("guest\(a)") != nil {
            owderFoodList = ud.objectForKey("guest\(a)") as! NSArray
        }
        return owderFoodList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var ud = NSUserDefaults.standardUserDefaults()
        if ud.objectForKey("guest\(a)") != nil {
            owderFoodList = ud.objectForKey("guest\(a)") as! NSArray
        }
        var cell = UITableViewCell(style: .Default,reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(owderFoodList[indexPath.row]["food"] as! String)   ¥\(owderFoodList[indexPath.row]["price"] as! String)"
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
