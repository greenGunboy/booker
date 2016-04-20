//
//  owderResultViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class owderResultViewController: UIViewController {
    
    var foodArray = []
    var drinkArray = []
    var ha = []
    
    @IBOutlet weak var guestNameLabel: UILabel!
    @IBOutlet weak var checkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var a = appDelegate.guestNumber
        var ud = NSUserDefaults.standardUserDefaults()
        var udResult:NSArray = ud.objectForKey("name") as! NSArray
        self.guestNameLabel.text = "\(udResult[a] as! String)様"
        if ud.objectForKey("guest\(a)") != nil {
            foodArray = ud.objectForKey("guest\(a)") as! [NSDictionary]
            var i = 1
//            var ab /= foodArray[i]["price"] as! Int
            var bv = foodArray[1]["price"] as! Int
            
            for var i = 0; i <= foodArray.count; i += 1 {
//                var ab = foodArray[i]["price"] as! Int
                ha = foodArray[i]["price"] as! [Int]
                print(ha)
            }
//            var plus = { (a: Int, b: Int) -> Int in a + b }
//            var num = ha.reduce(0, combine: plus)
//            self.checkLabel.text = "\(num)"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "owderListView" {
            var newVC = segue.destinationViewController as! foodOwderListViewController
        }
        if segue.identifier == "owderAddView" {
            var newVC = segue.destinationViewController as! owderAddViewController
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
