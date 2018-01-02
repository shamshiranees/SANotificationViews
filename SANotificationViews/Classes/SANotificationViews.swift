//
//  SANotificationViews.swift
//  SANotificationViews.swift
//
//  Created by Shamshir on 29/12/17.
//  Copyright © 2017 shamshir. All rights reserved.
//


import UIKit


open class SANotificationView: NSObject {
    
    
    class var mainInstance : SANotificationView {
        struct Static {
            static let inst : SANotificationView = SANotificationView()
        }
        return Static.inst
    }
    
    
    fileprivate func currentViewController() -> UIViewController? {
        
        var presentedWindow = UIApplication.shared.keyWindow?.rootViewController
        while let pWindow = presentedWindow?.presentedViewController
        {
            presentedWindow = pWindow
        }
        
        return presentedWindow
    }
    
    fileprivate func currentWindow() -> UIWindow {
        
        let presentedWindow = UIApplication.shared.keyWindow
        
        
        return presentedWindow!
    }
    
    
    private var statusBarView = UIView()
    private  var statusBarLabel = UILabel()
    
    private var isNavbarPresent : Bool = false
    
    private var SABarViewTimer : Timer!
    private var SABarView = UIView()
    private var SABarBgView = UIView()
    private var SABarTitleLabel = UILabel()
    private var SABarLabel = UILabel()
    private var SABarImageView = UIImageView()
    private var SABarPullView = UIImageView()
    
    
    
    
    // MARK: - showSAStatusBarBanner
    open class func showSAStatusBarBanner(message:String,backgroundColor:UIColor,textColor:UIColor,showTime:Int){
        
        
        //statusBarView
        mainInstance.statusBarView.frame = CGRect(x: 0, y:0, width:  mainInstance.currentWindow().frame.width, height: 0)
        mainInstance.statusBarView.backgroundColor = backgroundColor
        mainInstance.currentWindow().addSubview(mainInstance.statusBarView)
        
        
        //statusBarLabel
        mainInstance.statusBarLabel.frame = CGRect(x: 0, y: 0, width: mainInstance.currentWindow().frame.width, height: 0)
        mainInstance.statusBarLabel.text = message
        mainInstance.statusBarLabel.textAlignment = .center
        mainInstance.statusBarLabel.font = UIFont.systemFont(ofSize: 12)
        mainInstance.statusBarLabel.textColor = textColor
        mainInstance.statusBarLabel.numberOfLines = 1
        mainInstance.statusBarView.addSubview(mainInstance.statusBarLabel)
        
        
        //Animation
        UIView.animate(withDuration: 0.3) {
            
            if UIDevice().userInterfaceIdiom == .phone && UIScreen.main.nativeBounds.height == 2436 {
                //iPhone X
                print("This view doesn't support iphoneX.Please use showSATinyBanner")
                //                mainInstance.statusBarView.frame =  CGRect(x: 0, y:UIApplication.shared.statusBarFrame.height, width: mainInstance.currentWindow().frame.width, height: 20)
                //                mainInstance.statusBarLabel.frame = CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 20)
            }else{
                mainInstance.statusBarView.window?.windowLevel = UIWindowLevelStatusBar+1
                mainInstance.statusBarView.frame =  CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: UIApplication.shared.statusBarFrame.height)
                mainInstance.statusBarLabel.frame = CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: UIApplication.shared.statusBarFrame.height)
                
            }
            
        }
        
        Timer.scheduledTimer(timeInterval: TimeInterval(showTime), target: self, selector: #selector(removeStatusView), userInfo: nil, repeats: false)
        
    }
    
    // MARK: - showSABanner
    open class func showSABanner(title:String,message:String,textColor:UIColor,image:UIImage,backgroundColor:UIColor,showTime:Int){
        
        //SABarBgView
        mainInstance.SABarBgView.frame = CGRect(x: 0, y:0, width:  mainInstance.currentWindow().frame.width, height: 0)
        mainInstance.SABarBgView.backgroundColor = backgroundColor
        mainInstance.currentWindow().addSubview(mainInstance.SABarBgView)
        
        
        //SABarView
        mainInstance.SABarView.frame = CGRect(x: 0, y:0, width:  mainInstance.currentWindow().frame.width, height: 0)
        mainInstance.SABarView.backgroundColor = backgroundColor
        mainInstance.SABarView.layer.masksToBounds = true
        mainInstance.currentWindow().addSubview(mainInstance.SABarView)
        
        
        //SABarTitleLabel
        mainInstance.SABarTitleLabel.frame = CGRect(x: 80, y: UIApplication.shared.statusBarFrame.height+5, width: mainInstance.currentWindow().frame.width-90, height: 10)
        mainInstance.SABarTitleLabel.text = title
        mainInstance.SABarTitleLabel.textAlignment = .left
        mainInstance.SABarTitleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        mainInstance.SABarTitleLabel.sizeToFit()
        mainInstance.SABarTitleLabel.textColor = textColor
        mainInstance.SABarTitleLabel.numberOfLines = 1
        mainInstance.SABarView.addSubview(mainInstance.SABarTitleLabel)
        
        //SABarLabel
        mainInstance.SABarLabel.frame = CGRect(x: 80, y: UIApplication.shared.statusBarFrame.height+25, width: mainInstance.currentWindow().frame.width-90, height: 15)
        mainInstance.SABarLabel.text = message
        mainInstance.SABarLabel.textAlignment = .left
        mainInstance.SABarLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 12)
        mainInstance.SABarLabel.lineBreakMode = .byWordWrapping
        mainInstance.SABarLabel.textColor = .black
        mainInstance.SABarLabel.numberOfLines = 1
        mainInstance.SABarView.addSubview(mainInstance.SABarLabel)
        
        //SAImageView
        mainInstance.SABarImageView.frame = CGRect(x: 20, y: UIApplication.shared.statusBarFrame.height, width: 50, height: 50)
        mainInstance.SABarView.addSubview(mainInstance.SABarImageView)
        mainInstance.SABarImageView.image = image
        mainInstance.SABarImageView.layer.cornerRadius = mainInstance.SABarImageView.frame.height/2
        mainInstance.SABarImageView.layer.masksToBounds = true
        
        
        
        //SAPullImageView
        
        mainInstance.SABarPullView.frame = CGRect(x: 0, y: 0, width: 70, height: 5)
        mainInstance.SABarPullView.center = CGPoint(x: mainInstance.currentWindow().frame.width/2, y: UIApplication.shared.statusBarFrame.height+64-7)
        mainInstance.SABarPullView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        mainInstance.SABarPullView.layer.cornerRadius = mainInstance.SABarPullView.frame.height/2
        mainInstance.SABarView.addSubview(mainInstance.SABarPullView)
        
        //Gesture
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(removeSABarView))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        mainInstance.SABarView.addGestureRecognizer(swipeUp)
        
        //Animation
        
        UIView.animate(withDuration: 0.3, animations: {
            mainInstance.SABarBgView.frame = CGRect(x: 0, y:0, width:  mainInstance.currentWindow().frame.width, height: UIApplication.shared.statusBarFrame.height+64)
            mainInstance.SABarView.frame =  CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: UIApplication.shared.statusBarFrame.height+64)
        }) { (true) in
            dropShadow(view: mainInstance.SABarBgView, scale: true)
        }
        
        mainInstance.SABarViewTimer  = Timer.scheduledTimer(timeInterval: TimeInterval(showTime), target: self, selector: #selector(removeSABarView), userInfo: nil, repeats: false)
        
        
        
    }
    
    // MARK: - showSABanner without bgcolor and text color
    
    open class func showSABanner(title:String,message:String,image:UIImage,showTime:Int){
        
        
        showSABanner(title: title, message: message, textColor: .black, image: image, backgroundColor: .white, showTime: showTime)
    }
    
    
    
    // MARK: - showSATinyBanner
    open class func showSATinyBanner(message:String,backgroundColor:UIColor,textColor:UIColor,showTime:Int){
        
        
        //statusBarView
        
        let nav = UIApplication.shared.keyWindow?.rootViewController
        if (nav is UINavigationController) {
            let navc = nav as? UINavigationController
            if navc?.isNavigationBarHidden ?? false {
                //no navigation bar
                mainInstance.isNavbarPresent = false
                mainInstance.statusBarView.frame = CGRect(x: 0, y:0, width:  mainInstance.currentWindow().frame.width, height: 0)
            }
            else {
                // navigation bar
                
                
                mainInstance.isNavbarPresent = true
                mainInstance.statusBarView.frame = CGRect(x: 0, y:44+UIApplication.shared.statusBarFrame.height, width:  mainInstance.currentWindow().frame.width, height: 0)
            }
        }
        
        
        
        mainInstance.statusBarView.backgroundColor = backgroundColor
        mainInstance.currentViewController()?.view.addSubview(mainInstance.statusBarView)
        
        //statusBarLabel
        mainInstance.statusBarLabel.frame = CGRect(x: 0, y: 0, width: mainInstance.currentWindow().frame.width, height: 0)
        mainInstance.statusBarLabel.text = message
        mainInstance.statusBarLabel.textAlignment = .center
        mainInstance.statusBarLabel.font = UIFont.systemFont(ofSize: 12)
        mainInstance.statusBarLabel.textColor = textColor
        mainInstance.statusBarLabel.numberOfLines = 1
        mainInstance.statusBarView.addSubview(mainInstance.statusBarLabel)
        
        //Animation
        UIView.animate(withDuration: 0.3) {
            
            if mainInstance.isNavbarPresent{
                mainInstance.statusBarView.frame =  CGRect(x: 0, y:44+UIApplication.shared.statusBarFrame.height, width: mainInstance.currentWindow().frame.width, height: 20)
                mainInstance.statusBarLabel.frame = CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 20)
            }else{
                mainInstance.statusBarView.window?.windowLevel = UIWindowLevelStatusBar+1
                mainInstance.statusBarView.frame =  CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: UIApplication.shared.statusBarFrame.height+20)
                mainInstance.statusBarLabel.frame = CGRect(x: 0, y:UIApplication.shared.statusBarFrame.height, width: mainInstance.currentWindow().frame.width, height: 20)
            }
            
        }
        if showTime == 0{}else{
            Timer.scheduledTimer(timeInterval: TimeInterval(showTime), target: self, selector: #selector(removeSATinyBanner), userInfo: nil, repeats: false)
        }
       
    }
    
    
    
   
    
    
    //MARK: - show permanent tiny banner
    open class func showSATinyBanner(message:String,backgroundColor:UIColor,textColor:UIColor){
        
       showSATinyBanner(message: message, backgroundColor: backgroundColor, textColor: textColor, showTime: 0)
        
        
    }
    
    //MARK:- Remove views
    @objc open class func removeStatusView(){
        
    
        
        UIView.animate(withDuration: 0.3, animations: {
            mainInstance.statusBarView.frame =  CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 0)
            mainInstance.statusBarLabel.frame = CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 0)
        }) { (true) in
            mainInstance.statusBarView.window?.windowLevel = UIWindowLevelStatusBar-1
        }
        
    }
    
    
    
    
    
    @objc private class func removeSABarView(){
        
        mainInstance.SABarViewTimer.invalidate()
        UIView.animate(withDuration: 0.3) {
            mainInstance.SABarBgView.layer.shadowOpacity = 0.0
            mainInstance.SABarBgView.frame =  CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 0)
            mainInstance.SABarView.frame =  CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 0)
        }
        
        
    }
    
    
    
    @objc public class func removeSATinyBanner(){
        
        UIView.animate(withDuration: 0.3) {
            if mainInstance.isNavbarPresent{
                mainInstance.statusBarView.frame =  CGRect(x: 0, y:44+UIApplication.shared.statusBarFrame.height, width: mainInstance.currentWindow().frame.width, height: 0)
            }else{
                mainInstance.statusBarView.frame =  CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 0)
                mainInstance.statusBarView.window?.windowLevel = UIWindowLevelStatusBar-1
            }
            mainInstance.statusBarLabel.frame = CGRect(x: 0, y:0, width: mainInstance.currentWindow().frame.width, height: 0)
        }
        
        
        
    }
    
    private class func dropShadow(view:UIView,scale:Bool) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.darkText.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 1
        
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
}

