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
    var drinkAddArray = []
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
        }
        if pickerView.tag == 3 {
            foodInt = row
        }
        if pickerView.tag == 4 {
            drinkInt = row
        }
    }
    
    @IBAction func foodAddBtn(sender: UIButton) {
//        デリゲートを読み込み
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        選択されているゲストナンバーを変数へ
        var a = appDelegate.guestNumber as! Int
//        userdefaultの読み込み
        var ud = NSUserDefaults.standardUserDefaults()
//        udのfoodキー配列を変数へ
        var food = ud.objectForKey("food") as! [NSDictionary]
        var foodNamae = food[foodPrice]["name"]
        var foodNedan = food[foodPrice]["price"] as! Int
//        [メニュー名：値段]を配列へ
        var foodAdd:NSDictionary = ["food":foodNamae!, "price":foodNedan]
//        udのnameキーを変数へ
        var udResult:NSArray = ud.objectForKey("name") as! NSArray
//        選択されているゲストの名前を出力
        var guestName = udResult[a]
        print(guestName)
//        udのゲスト名foodキーを読み込み
        if ud.objectForKey("guest\(a)") != nil {
            foodAddArray = ud.objectForKey("guest\(a)") as! [NSDictionary]
        }
//        foodInt(注文数)の数分
//        for var i = 0; i > foodInt; i++ {
//            配列に追加
            foodAddArray.append(foodAdd)
//            選択されたキーへ保存
            ud.setObject(foodAddArray, forKey: "guest\(a)")
            ud.synchronize()
//        }
        var t = Int(foodNedan + 8)
        print(t)
        let alertController = UIAlertController(title: "\(addFood)を\(foodInt)個", message: "注文完了", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
        
        print(foodAdd)
    }
    
    @IBAction func drinkAddBtn(sender: UIButton) {
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
