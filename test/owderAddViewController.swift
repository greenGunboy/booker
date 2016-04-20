//
//  owderAddViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class owderAddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var foodListPicker: UIPickerView!
    @IBOutlet weak var drinkListPicker: UIPickerView!
    @IBOutlet weak var foodNumberPicker: UIPickerView!
    @IBOutlet weak var drinkNumberPicker: UIPickerView!
    
    var foodAddArray:[NSDictionary] = []
    var drinkAddArray:[NSDictionary] = []
    var addFood = ""
    var addDrink = ""
    var foodInt = 0
    var drinkInt = 0
    var foodPrice = 0
    var drinkPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        foodListPicker.dataSource = self
        foodListPicker.delegate = self
        drinkListPicker.dataSource = self
        drinkListPicker.delegate = self
        foodNumberPicker.dataSource = self
        foodNumberPicker.delegate = self
        drinkNumberPicker.dataSource = self
        drinkNumberPicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            var ud = NSUserDefaults.standardUserDefaults()
            var foodList: NSArray = ud.objectForKey("food") as! NSArray
            return foodList.count
        }
        if pickerView.tag == 2 {
            var ud = NSUserDefaults.standardUserDefaults()
            var drinkList: NSArray = ud.objectForKey("drink") as! NSArray
            return drinkList.count
        }
        return 11
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            var ud = NSUserDefaults.standardUserDefaults()
            var foodList: NSArray = ud.objectForKey("food") as! NSArray
            return "\(foodList[row]["name"] as! String)"
        }
        if pickerView.tag == 2 {
            var ud = NSUserDefaults.standardUserDefaults()
            var drinkList: NSArray = ud.objectForKey("drink") as! NSArray
            return "\(drinkList[row]["name"] as! String)"
        }
        return "\(row)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var ud = NSUserDefaults.standardUserDefaults()
        var foodList: NSArray = ud.objectForKey("food") as! NSArray
        var drinkList: NSArray = ud.objectForKey("drink") as! NSArray
        
        if pickerView.tag == 1 {
            addFood = foodList[row]["name"] as! String
            foodPrice = row
        }
        
        if pickerView.tag == 2 {
            addDrink = drinkList[row]["name"] as! String
            drinkPrice = row
        }
        if pickerView.tag == 3 {
            foodInt = row
        }
        if pickerView.tag == 4 {
            drinkInt = row
        }
    }
    
    @IBAction func foodAddBtn(sender: UIButton) {
        if foodInt == 0 {
            
            let alertController = UIAlertController(title: "個数が０個です", message: "個数を指定してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            
        }else{
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            var a = appDelegate.guestNumber as! Int
            var ud = NSUserDefaults.standardUserDefaults()
            var food = ud.objectForKey("food") as! [NSDictionary]
            var foodNamae = food[foodPrice]["name"]
            var foodNedan = food[foodPrice]["price"] as! Int
            
            for var i = 0; i <= foodInt - 1; i++ {
                
                var foodAdd:NSDictionary = ["food":foodNamae!, "price":foodNedan]
                var udResult:NSArray = ud.objectForKey("name") as! NSArray
                var guestName = udResult[a]
                
                if ud.objectForKey("guest\(a)") != nil {
                    foodAddArray = ud.objectForKey("guest\(a)") as! [NSDictionary]
                }
                
                foodAddArray.append(foodAdd)
                ud.setObject(foodAddArray, forKey: "guest\(a)")
                ud.synchronize()
            }
            
            let alertController = UIAlertController(title: "\(addFood)を\(foodInt)個", message: "注文完了", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }


    @IBAction func drinkAddBtn(sender: UIButton) {
        if drinkInt == 0 {
            
            let alertController = UIAlertController(title: "個数が０個です", message: "個数を指定してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            
        }else{
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            var a = appDelegate.guestNumber as! Int
            var ud = NSUserDefaults.standardUserDefaults()
            var drink = ud.objectForKey("drink") as! [NSDictionary]
            var drinkNamae = drink[drinkPrice]["name"]
            var drinkNedan = drink[drinkPrice]["pricedrink"] as! Int
            
            for var i = 0; i <= drinkInt - 1; i++ {
                
                var drinkAdd:NSDictionary = ["drink":drinkNamae!, "pricedrink":drinkNedan]
                var udResult:NSArray = ud.objectForKey("name") as! NSArray
                var guestName = udResult[a]
                
                if ud.objectForKey("guest\(a)drink") != nil {
                    drinkAddArray = ud.objectForKey("guest\(a)drink") as! [NSDictionary]
                }
                
                drinkAddArray.append(drinkAdd)
                ud.setObject(drinkAddArray, forKey: "guest\(a)drink")
                ud.synchronize()
            }
            
            let alertController = UIAlertController(title: "\(addDrink)を\(drinkInt)個", message: "注文完了", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var newVC = segue.destinationViewController as! owderResultViewController
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
