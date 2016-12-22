//
//  panGestureViewController.swift
//  Example-Swift
//
//  Created by LOGIN on 2016-12-20.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class panGestureViewController: UIViewController, YALTabBarDelegate {
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    var rightProfileView:  UIView!
    var centerProfileView: UIView!
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    
    @IBOutlet weak var testButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.didReceiveMemoryWarning()
        centerProfileView = self.view
        screenWidth = self.view.frame.size.width;
        screenHeight = self.view.frame.size.height;
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
                                                                action: #selector(EmptyViewController.swiped(_:)))
        screenEdgeRecognizer.edges = .right
        view.addGestureRecognizer(screenEdgeRecognizer)
        self.testButton.backgroundColor = UIColor.clear

    }
    
    override func didReceiveMemoryWarning() {
   
    }
    
    func swiped(_ gesture: UIScreenEdgePanGestureRecognizer) {
        
        var translation = gesture.translation(in: gesture.view)
        var width: CGFloat = self.view.frame.size.width
        var percent: CGFloat = max(-gesture.translation(in: self.view).x, 0) / width
     
        switch gesture.state {
            
        case .began:
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "item1") as! EmptyViewController
        rightProfileView = controller.view
        self.view.addSubview(rightProfileView)
        var shadowPath = UIBezierPath(rect: rightProfileView.bounds)
        rightProfileView.layer.masksToBounds = false
        rightProfileView.layer.shadowColor! = UIColor.black.cgColor
        rightProfileView.layer.shadowOffset = CGSize(width: CGFloat(0.0), height: CGFloat(5.0))
        rightProfileView.layer.shadowOpacity = 1
        rightProfileView.layer.shadowPath = shadowPath.cgPath
        
        case .changed:
      
//            centerProfileView.frame = CGRect(x: CGFloat(0 + translation.x / 3), y: CGFloat(0), width: CGFloat(screenWidth), height: CGFloat(480))
            rightProfileView.frame = CGRect(x: CGFloat(screenWidth + translation.x), y: CGFloat(0), width: CGFloat(screenWidth), height: CGFloat(self.screenHeight))
            rightProfileView.isUserInteractionEnabled = false
            self.view.isUserInteractionEnabled = false
            break
            
         case .ended:
            
            if percent > 0.5 || fabs(gesture.velocity(in: self.view).x) > 1000{
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {() -> Void in
                self.centerProfileView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(self.screenWidth), height: CGFloat(self.screenHeight))
                self.rightProfileView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(self.screenWidth), height: CGFloat(self.screenHeight))
            }, completion: {(_ completed: Bool) -> Void in
//                self.view = self.rightProfileView
//                self.centerProfileView.removeFromSuperview()
                self.centerProfileView = self.rightProfileView
                
                
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

        
//        self.view.addSubview(rightProfileView)
//
 
//        switch sender.state {
//        case .began : break
//            
//        default : break
//        }
//        
//        
//        print("hahhaha")
//        if (sender.edges == .left) {
//            let x = tabBarController?.selectedIndex
//            self.tabBarController?.selectedIndex = ( x! == 3 ? 3 : x!+1)
//        }
        
    }
    
//    func tabBar(_ tabBar: YALFoldingTabBar, didSelectItemAt index: UInt) {
//        if index == 3 {
//            let vc = leftpanGestViewController()
//            self.present(vc, animated: false, completion: nil)
//        }
//    }
    
    func tabBar(_ tabBar: YALFoldingTabBar, didSelectItemAt index: UInt) {
                print("sdfdf")
                print("sdfdf")
                print("sdfdf")
                print("sdfdf")
                print("sdfdf")
    }

//    
//    func tabBar(_ tabBar: YALFoldingTabBar, didSelectItemAt index: UInt) {
//        print("sdfdf")
//        print("sdfdf")
//        print("sdfdf")
//        print("sdfdf")
//        print("sdfdf")
//        
//    }
    
    func tabBar(_ tabBar: YALFoldingTabBar, shouldSelectItemAt index: UInt) -> Bool {
        print(index == 1)
        return index == 1
    }

    
    @IBAction func test(_ sender: Any) {
       self.testButton.backgroundColor = UIColor.brown
        print("omg")
    }
    
    func tabBarDidSelectExtraLeftItem(_ tabBar: YALFoldingTabBar) {
        print("left")
        print("left")
        print("left")
        print("left")
        print("left")
        print("left")
        print("left")
        print("left")
    }
    
    func tabBarDidSelectExtraRightItem(_ tabBar: YALFoldingTabBar) {
        print("right")
        print("right")
        print("right")
        print("right")
        print("right")
        print("right")
        
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
