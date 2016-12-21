//
//  leftpanGestViewController.swift
//  Example-Swift
//
//  Created by LOGIN on 2016-12-20.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class leftpanGestViewController: UIViewController, UIGestureRecognizerDelegate {

    
    var PanGesture: UIPanGestureRecognizer!
    var rightProfileView:  UIView!
    var centerProfileView: UIView!
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.didReceiveMemoryWarning()
        centerProfileView = self.view
        screenWidth = self.view.frame.size.width;
        screenHeight = self.view.frame.size.height;
        
        PanGesture = UIPanGestureRecognizer(target: self, action: #selector(leftpanGestViewController.swiped(_:)))
        PanGesture.delegate = self
        view.addGestureRecognizer(PanGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func swiped(_ gesture: UIPanGestureRecognizer) {
        
        var translation = gesture.translation(in: gesture.view)
        var width: CGFloat = self.view.frame.size.width
        var percent: CGFloat = max(-gesture.translation(in: self.view).x, 0) / width
        
        switch gesture.state {
            
        case .began:
            if self.tabBarController?.selectedIndex == 3 && translation.x > 0 {
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "item2") as! panGestureViewController
            rightProfileView = controller.view
            self.view.addSubview(rightProfileView)
            var shadowPath = UIBezierPath(rect: rightProfileView.bounds)
            rightProfileView.layer.masksToBounds = false
            rightProfileView.layer.shadowColor! = UIColor.black.cgColor
            rightProfileView.layer.shadowOffset = CGSize(width: CGFloat(0.0), height: CGFloat(5.0))
            rightProfileView.layer.shadowOpacity = 1
            rightProfileView.layer.shadowPath = shadowPath.cgPath
            
        case .changed:
            if self.tabBarController?.selectedIndex == 3 && translation.x > 0 {
                return
            }
            //            centerProfileView.frame = CGRect(x: CGFloat(0 + translation.x / 3), y: CGFloat(0), width: CGFloat(screenWidth), height: CGFloat(480))
            rightProfileView.frame = CGRect(x: CGFloat(screenWidth + translation.x), y: CGFloat(0), width: CGFloat(screenWidth), height: CGFloat(self.screenHeight))
            rightProfileView.isUserInteractionEnabled = false
            self.view.isUserInteractionEnabled = false
            break
            
        case .ended:
            if self.tabBarController?.selectedIndex == 3 && translation.x > 0 {
                return
            }
            if percent > 0.5 || fabs(gesture.velocity(in: self.view).x) > 200{
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {() -> Void in
                    self.centerProfileView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(self.screenWidth), height: CGFloat(self.screenHeight))
                    self.rightProfileView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(self.screenWidth), height: CGFloat(self.screenHeight))
                }, completion: {(_ completed: Bool) -> Void in

                    let index = 1
                    self.tabBarController?.selectedIndex = index
                })
            }
            else {
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {() -> Void in
                    self.centerProfileView.frame = CGRect(x: CGFloat(0), y: CGFloat(self.view.frame.origin.y), width: CGFloat(self.screenWidth), height: CGFloat(self.screenHeight))
                    self.rightProfileView.frame = CGRect(x: CGFloat(self.screenWidth), y: CGFloat(self.view.frame.origin.y), width: CGFloat(self.screenWidth), height: CGFloat(self.screenHeight))
                }, completion: {(_ completed: Bool) -> Void in
                    self.rightProfileView.removeFromSuperview()
                    self.rightProfileView = nil
                })
            }
            rightProfileView.isUserInteractionEnabled = true
            self.view.isUserInteractionEnabled = true
            break
        default:
            break
        }
        
        //
        //        print("hahhaha")
        //        if (sender.edges == .left) {
        //            let x = tabBarController?.selectedIndex
        //            self.tabBarController?.selectedIndex = ( x! == 3 ? 3 : x!+1)
        //        }
        
    }

    
    func tabBarDidSelectExtraLeftItem(_ tabBar: YALFoldingTabBar) {

    }
    
    func tabBarDidSelectExtraRightItem(_ tabBar: YALFoldingTabBar) {

        
    }
    
    
    func tabBarWillExpand(_ tabBar: YALFoldingTabBar) {
        print("will expand")
    }
    
    func tabBarDidExpand(_ tabBar: YALFoldingTabBar) {
        print("did expand")
    }
    
    func tabBarWillCollapse(_ tabBar: YALFoldingTabBar) {
        print("will collapse")
    }
    
    func tabBarDidCollapse(_ tabBar: YALFoldingTabBar) {
        print("did collapse")
    }


}
