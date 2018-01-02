//
//  ViewController.swift
//  SANotificationViews
//
//  Created by smzranz@gmail.com on 01/02/2018.
//  Copyright (c) 2018 smzranz@gmail.com. All rights reserved.
//

import UIKit
import SANotificationViews

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func statusBarBanner(_ sender: Any) {
        SANotificationView.showSAStatusBarBanner(message: "This is status bar banner...", backgroundColor: hexStringToUIColor(hex: "235677"), textColor: .white, showTime: 2)
        
    }
    
    
    @IBAction func tinyBanner(_ sender: Any) {
        SANotificationView.showSATinyBanner(message: "Please wait while loading...😊", backgroundColor: hexStringToUIColor(hex: "235677"), textColor: .white, showTime: 2)
        
    }
    
    
    @IBAction func permanentBanner(_ sender: Any) {
        SANotificationView.showSATinyBanner(message: "Permanent Banner...😊", backgroundColor: hexStringToUIColor(hex: "235677"), textColor: .white)
    }
    
    
    @IBAction func removePermanentBanner(_ sender: Any) {
        
        SANotificationView.removeSATinyBanner()
    }
    
    
    @IBAction func saBanner(_ sender: Any) {
        
         SANotificationView.showSABanner(title: "V.S Achuthananthan", message: "V.S Achuthananthan just liked the your post you shared", image: #imageLiteral(resourceName: "sampleImage"),  showTime: 3)
    }
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

