//
//  EmptyViewController.swift
//  Example-Swift
//
//  Created by Serhii Butenko on 29/8/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController, YALTabBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let reveal = UISwipeGestureRecognizer(target: self, action: #selector(EmptyViewController.swiped(_:)))
        let next = UISwipeGestureRecognizer(target: self, action: #selector(EmptyViewController.swiped(_:)))
        reveal.direction = .right
        next.direction = .left

        view.addGestureRecognizer(reveal)
        view.addGestureRecognizer(next)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func swiped(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            let x = tabBarController?.selectedIndex
            self.tabBarController?.selectedIndex = ( x! == 3 ? 3 : x!+1)
        }
        if (sender.direction == .right) {
            let x = tabBarController?.selectedIndex
            self.tabBarController?.selectedIndex = (x! == 0 ? 0 : x!-1 )
            
        }
    
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
