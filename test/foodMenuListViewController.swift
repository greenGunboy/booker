//
//  foodMenuListViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class foodMenuListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        var ud = NSUserDefaults.standardUserDefaults()
        var guestList = ud.arrayForKey("food")!
        guestList.removeAtIndex(indexPath.row)
        ud.setObject(guestList, forKey: "food")
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var ud = NSUserDefaults.standardUserDefaults()
        var udideaList: NSArray? = ud.objectForKey("food") as? NSArray
        if udideaList == nil{
            udideaList = []
        }
        return udideaList!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var ud = NSUserDefaults.standardUserDefaults()
        var foodList: NSArray! = ud.objectForKey("food") as! NSArray
        var cell = UITableViewCell(style: .Default,reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(foodList[indexPath.row]["name"] as! String)     ¥\(foodList[indexPath.row]["price"] as! Int)"
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
        performSegueWithIdentifier("foodEditView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "foodEditView" {
            var listVC = segue.destinationViewController as! foodEditViewController
            listVC.scSeletedIndex = selectedIndex
        }
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
