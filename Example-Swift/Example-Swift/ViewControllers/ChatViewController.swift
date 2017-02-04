//
//  ChatViewController.swift
//  Example-Swift
//
//  Created by Serhii Butenko on 29/8/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

private let ChatDemoImageName = "imageName"
private let DemoUserName = "userName"
private let ChatDemoMessageText = "messageText"
private let ChatDemeDateText = "dateText"

private let reuseIdentifier = "ChatCollectionViewCell"

class ChatViewController: UIViewController, YALTabBarDelegate {
    
    func tabBar(_ tabBar: YALFoldingTabBar, didSelectItemAt index: UInt) {
        if index == 3 {
            let vc = leftpanGestViewController()
            self.present(vc, animated: false, completion: nil)
        }
    }

    func tabBarDidSelectExtraLeftItem(_ tabBar: YALFoldingTabBar) {
        print("Chat Left")
        print("Chat Left")
        print("Chat Left")
        print("Chat Left")
        print("Chat Left")
        print("Chat Left")
        print("Chat Left")
        print("Chat Left")
        print("Chat Left")

    }
    
    func tabBarDidSelectExtraRightItem(_ tabBar: YALFoldingTabBar) {
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")
        print("Chat Right")

    }
    
    typealias Message = [String: String]
    
    fileprivate var messages: [Message] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages = NSArray(contentsOfFile: Bundle.main.path(forResource: "YALChatDemoList", ofType: "plist")!) as! [Message]
        messages.append(contentsOf: NSArray(contentsOfFile: Bundle.main.path(forResource: "YALChatDemoList", ofType: "plist")!) as! [Message])
        
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
//        leftSwipe.direction = .left
//        rightSwipe.direction = .right
//        view.addGestureRecognizer(leftSwipe)
//        view.addGestureRecognizer(rightSwipe)
//        
//        func handleSwipes(sender:UISwipeGestureRecognizer) {
//            if (sender.direction == .left) {
//                print("Swipe Left")
////                let index = self.tabBarController?.selectedIndex
////                print(index!)
////                print(index!)
////                print(index!)
////                print(index!)
////                print(index!)
//
//            }
//            if (sender.direction == .right) {
//                print("Swipe Right")
//                
//            }
//        }
//
   }
    


}

extension ChatViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChatCollectionViewCell
        
        let message = messages[(indexPath as NSIndexPath).row]
        
        cell.configure(
            withImage: UIImage(named: message[ChatDemoImageName]!)!,
            userName: message[DemoUserName]!,
            messageText: message[ChatDemoMessageText]!,
            dateText: message[ChatDemeDateText]!
        )
        
        return cell
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        return CGSize(width: view.bounds.width, height: layout.itemSize.height)
    }
}

extension ChatViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.hidesBottomBarWhenPushed = true
    }
}
