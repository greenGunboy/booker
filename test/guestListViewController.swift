//
//  guestListViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class guestListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myGuestTableView: UITableView!
    
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
        var guestList = ud.arrayForKey("name")!
        guestList.removeAtIndex(indexPath.row)
        ud.setObject(guestList, forKey: "name")
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var ud = NSUserDefaults.standardUserDefaults()
        var udideaList: NSArray? = ud.objectForKey("name") as? NSArray
        if udideaList == nil{
            udideaList = []
        }
        return udideaList!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var ud = NSUserDefaults.standardUserDefaults()
        var udideaList: NSArray! = ud.objectForKey("name") as! NSArray
        var cell = UITableViewCell(style: .Default,reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(udideaList[indexPath.row] as! String)"
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.guestNumber = indexPath.row
        performSegueWithIdentifier("owderView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "owderView" {
            var listVC = segue.destinationViewController as! owderResultViewController
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
