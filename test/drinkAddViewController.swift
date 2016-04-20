//
//  drinkAddViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class drinkAddViewController: UIViewController {

    @IBOutlet weak var drinkNameText: UITextField!
    @IBOutlet weak var drinkPriceText: UITextField!
    
    var scSeletedIndex:Int = 0
    var drinkMenu:[NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func drinkAddBtn(sender: UIButton) {
        var name = drinkNameText.text
        var price = drinkPriceText.text
        
        if name == "" && price == "" {
            
            let alertController = UIAlertController(title: "空白があります", message: "入力してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            
        }else{
            var ud = NSUserDefaults.standardUserDefaults()
            
            if ud.objectForKey("drink") != nil{
                drinkMenu = ud.objectForKey("drink") as! [NSDictionary]
            }
            
            var drinkInfo: NSDictionary = ["name":name!, "price":price!]
            drinkMenu.append(drinkInfo)
            ud.setObject(drinkMenu, forKey: "drink")
            ud.synchronize()
            
            let alertController = UIAlertController(title: "\(name as! String!)", message: "drink Listへ保存しました", preferredStyle: .Alert)
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
