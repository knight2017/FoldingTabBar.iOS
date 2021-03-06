//
//  AppDelegate.swift
//  Example-Swift
//
//  Created by Serhii Butenko on 29/8/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupYALTabBarController()
        
        return true
    }
}

private extension AppDelegate {
    
    func setupYALTabBarController() {
        guard let tabBarController = window?.rootViewController as? YALFoldingTabBarController else { return }
        
        let item1 = YALTabBarItem(itemImage: UIImage(named: "nearby_icon"), leftItemImage: UIImage(named: "search_icon"), rightItemImage: UIImage(named: "edit_icon"))
        let item2 = YALTabBarItem(itemImage: UIImage(named: "profile_icon"), leftItemImage: UIImage(named: "edit_icon"), rightItemImage: UIImage(named: "new_chat_icon"))
        tabBarController.leftBarItems = [item1, item2]
        let item3 = YALTabBarItem(itemImage: UIImage(named: "chats_icon"), leftItemImage: UIImage(named: "search_icon"), rightItemImage: UIImage(named: "new_chat_icon"))
        let item4 = YALTabBarItem(itemImage: UIImage(named: "settings_icon"), leftItemImage: nil, rightItemImage: nil)
        tabBarController.rightBarItems = [item3, item4]
        
        tabBarController.centerButtonImage = UIImage(named:"nearby_icon")!
        tabBarController.selectedIndex = 3

        //customize tabBarView
        tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
        tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
        tabBarController.tabBarView.backgroundColor =  UIColor.clear
        tabBarController.tabBarView.tabBarColor = UIColor(red: 72.0/255.0, green: 211.0/255.0, blue: 178.0/255.0, alpha: 1)
        tabBarController.tabBarView.dotColor = UIColor.orange
        tabBarController.tabBarViewHeight = YALTabBarViewDefaultHeight;
        tabBarController.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
        tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
    }
}
