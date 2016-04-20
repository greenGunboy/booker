//
//  drinkMenuListViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class drinkMenuListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        var ud = NSUserDefaults.standardUserDefaults()
        var guestList = ud.arrayForKey("drink")!
        guestList.removeAtIndex(indexPath.row)
        ud.setObject(guestList, forKey: "drink")
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var ud = NSUserDefaults.standardUserDefaults()
        var drinkList: NSArray? = ud.objectForKey("drink") as? NSArray
        if drinkList == nil{
            drinkList = []
        }
        return drinkList!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var ud = NSUserDefaults.standardUserDefaults()
        var drinkList: NSArray! = ud.objectForKey("drink") as! NSArray
        var cell = UITableViewCell(style: .Default,reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(drinkList[indexPath.row]["name"] as! String)　　　¥\(drinkList[indexPath.row]["pricedrink"] as! Int)"
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
        performSegueWithIdentifier("drinkEditView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "drinkEditView" {
            var listVC = segue.destinationViewController as! drinkEditViewController
            listVC.scSelectedIndex = selectedIndex
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
