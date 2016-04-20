//
//  drinkEditViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class drinkEditViewController: UIViewController {

    @IBOutlet weak var drinkName: UITextField!
    @IBOutlet weak var drinkPrice: UITextField!
    
    var scSelectedIndex:Int = 0
    var drinkMenu:[NSDictionary] = []
    
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
        drinkMenu = ud.objectForKey("drink") as! [NSDictionary]
        
        drinkName.text = drinkMenu[scSelectedIndex]["name"] as! String
        print(drinkMenu[scSelectedIndex]["pricedrink"] as! Int)
        self.drinkPrice.text = "\(drinkMenu[scSelectedIndex]["pricedrink"] as! Int)"
    }
    
    @IBAction func drinkEditBtn(sender: UIButton) {
        var name = drinkName.text
        var price = Int(drinkPrice.text!)
        
        if name == "" && price == 0 {
            let alertController = UIAlertController(title: "空白があります", message: "入力してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }else{
            var ud = NSUserDefaults.standardUserDefaults()
            drinkMenu = ud.objectForKey("drink") as! [NSDictionary]
            drinkMenu[scSelectedIndex] = ["name":name!, "pricedrink":price!]
            ud.setObject(drinkMenu, forKey: "drink")
            ud.synchronize()
            
            let alertController = UIAlertController(title: "\(name as! String!)  ¥\(price as! Int!)", message: "編集完了しました", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.move()}))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func move() {
        var targetView: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("drinkMenuListViewController")
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
