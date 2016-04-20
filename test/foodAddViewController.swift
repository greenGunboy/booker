//
//  foodAddViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class foodAddViewController: UIViewController {

    @IBOutlet weak var foodNameText: UITextField!
    @IBOutlet weak var foodPriceText: UITextField!
    
    var foodMenu:[NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func foodAddBtn(sender: UIButton) {
        var name = foodNameText.text
        var price = Int(foodPriceText.text!)
        
        if name == "" || price == nil {
            
            let alertController = UIAlertController(title: "空白があります", message: "入力してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }else{
            var ud = NSUserDefaults.standardUserDefaults()
            
            if ud.objectForKey("food") != nil{
                foodMenu = ud.objectForKey("food") as! [NSDictionary]
            }
            
            var foodInfo: NSDictionary = ["name":name!, "price":price!]
            foodMenu.append(foodInfo)
            ud.setObject(foodMenu, forKey: "food")
            ud.synchronize()
            let alertController = UIAlertController(title: "\(name as! String!)", message: "Food Listへ保存しました", preferredStyle: .Alert)
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
