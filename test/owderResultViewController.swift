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
    var foodCheck = [Int]()
    var drinkCheck = [Int]()
    var num = 0
    var num2 = 0
    
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
            for var i = 0; i <= foodArray.count - 1; i += 1 {
                var fPrice = foodArray[i]["price"] as! Int
                foodCheck.append(fPrice as! Int)
            }
        }
        
        if ud.objectForKey("guest\(a)drink") != nil {
            drinkArray = ud.objectForKey("guest\(a)drink") as! [NSDictionary]
            for var i = 0; i <= drinkArray.count - 1; i += 1 {
                var dPrice = drinkArray[i]["pricedrink"] as! Int
                drinkCheck.append(dPrice as! Int)
            }
        }
            
        var plus = { (a: Int, b: Int) -> Int in a + b }
        num = foodCheck.reduce(0, combine: plus)
        num2 = drinkCheck.reduce(0, combine: plus)
        self.checkLabel.text = "\(num + num2)"
        
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
