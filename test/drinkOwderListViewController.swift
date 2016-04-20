//
//  drinkOwderListViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class drinkOwderListViewController: UIViewController {
    
    var owderDrinkList = []
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
        if ud.objectForKey("guest\(a)drink") != nil {
            owderDrinkList = ud.objectForKey("guest\(a)drink") as! NSArray
        }
        print(owderDrinkList)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var ud = NSUserDefaults.standardUserDefaults()
        var owderList = ud.arrayForKey("guest\(a)drink")!
        owderList.removeAtIndex(indexPath.row)
        ud.setObject(owderList, forKey: "guest\(a)drink")
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var ud = NSUserDefaults.standardUserDefaults()
        if ud.objectForKey("guest\(a)drink") != nil {
            owderDrinkList = ud.objectForKey("guest\(a)drink") as! NSArray
        }
        return owderDrinkList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var ud = NSUserDefaults.standardUserDefaults()
        if ud.objectForKey("guest\(a)") != nil {
            owderDrinkList = ud.objectForKey("guest\(a)drink") as! NSArray
        }
        var cell = UITableViewCell(style: .Default,reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(owderDrinkList[indexPath.row]["drink"] as! String)   ¥\(owderDrinkList[indexPath.row]["pricedrink"] as! Int)"
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
