//
//  panGestureViewController.swift
//  Example-Swift
//
//  Created by LOGIN on 2016-12-20.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class panGestureViewController: UIViewController {
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!


    override func viewDidLoad() {
        super.viewDidLoad()
        super.didReceiveMemoryWarning()
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
                                                                action: #selector(EmptyViewController.swiped(_:)))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
    }
    
    override func didReceiveMemoryWarning() {
   
    }
    
    func swiped(_ sender: UIScreenEdgePanGestureRecognizer) {
        print("hahhaha")
        if (sender.edges == .left) {
            let x = tabBarController?.selectedIndex
            self.tabBarController?.selectedIndex = ( x! == 3 ? 3 : x!+1)
        }
        
    }
    
    @IBAction func test(_ sender: Any) {
        
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
