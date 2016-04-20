//
//  foodEditViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class foodEditViewController: UIViewController {

    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var foodPrice: UITextField!
    
    var scSelectedIndex:Int = 0
    var foodMenu:[NSDictionary] = []
    
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
        foodMenu = ud.objectForKey("food") as! [NSDictionary]
        
        foodName.text = foodMenu[scSelectedIndex]["name"] as! String
        foodPrice.text = "\(foodMenu[scSelectedIndex]["price"] as! Int)"
    }
    
    @IBAction func foodEditBtn(sender: UIButton) {
        
        var name = foodName.text
        var price = Int(foodPrice.text!)
        
        if name == "" && price == 0 {
            let alertController = UIAlertController(title: "空白があります", message: "入力してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }else{
            var ud = NSUserDefaults.standardUserDefaults()
            foodMenu = ud.objectForKey("food") as! [NSDictionary]
            foodMenu[scSelectedIndex] = ["name":name!, "price":price!]
            ud.setObject(foodMenu, forKey: "food")
            ud.synchronize()
            
            let alertController = UIAlertController(title: "\(name as! String!)  ¥\(price! as! Int)", message: "編集完了しました", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.move()}))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func move() {
        var targetView: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("foodMenuListViewController")
        self.presentViewController(targetView, animated: true, completion: nil)
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
