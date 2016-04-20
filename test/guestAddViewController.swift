//
//  guestAddViewController.swift
//  test
//
//  Created by Tsubasa Takahashi on 2016/04/09.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class guestAddViewController: UIViewController {

    @IBOutlet weak var guestName: UITextField!
    
    var nameArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBtn(sender: UIButton) {
        var name : String = guestName.text!
        if name == ""{
            let alertController = UIAlertController(title: "空白です", message: "名前を入力してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }else{
            var ud = NSUserDefaults.standardUserDefaults()
            if ud.objectForKey("name") != nil{
                nameArray = ud.objectForKey("name") as! NSArray as! [String]
            }
            nameArray.append(name)
            ud.setObject(nameArray, forKey: "name")
            ud.synchronize()
            
            let alertController = UIAlertController(title: "\(name)", message: "Guest Listへ保存しました", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.move()}))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func move() {
        var targetView: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("guestListViewController")
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
