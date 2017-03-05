//
//  AppDelegate.swift
//  EmbededViewController
//
//  Created by yoshi-kou on 2017/03/05.
//  Copyright © 2017 ysn551. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var storyBoard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
    
    var window: UIWindow?
    
    lazy var containerViewController: RootContainerViewController? = {
        return self.window?.rootViewController as? RootContainerViewController
    }()

    func changeA() {
        let actr = self.storyBoard.instantiateViewController(withIdentifier: "A")
        self.displayContentController(content: actr)
    }
    
    func changeB() {
        let bctr = self.storyBoard.instantiateViewController(withIdentifier: "B")
        self.displayContentController(content: bctr)
    }
    
    func closeAllPresentedViewController(viewController: UIViewController?) {
        var presented: UIViewController? = nil
        if let temp = viewController?.presentedViewController {
            presented = temp
            self.closeAllPresentedViewController(viewController: presented)
        } else {
            return
        }
        
        presented?.dismiss(animated: false, completion: nil)
    }
    
    func displayContentController(content: UIViewController) {
        let containerVC = self.containerViewController!
        let oldVC = containerVC.childViewControllers.first!
//        if let presented = self.window?.rootViewController?.presentedViewController {
//            presented.dismiss(animated: false, completion: nil)
//        }
        self.closeAllPresentedViewController(viewController: oldVC)
        oldVC.willMove(toParentViewController: nil)
        containerVC.addChildViewController(content)
        content.view.frame = containerVC.contaninerView.frame
        
        content.beginAppearanceTransition(true, animated: false)
        oldVC.beginAppearanceTransition(false, animated: false)
        oldVC.view.removeFromSuperview()
        containerVC.contaninerView.addSubview(content.view)
        content.endAppearanceTransition()
        oldVC.endAppearanceTransition()
        
        oldVC.removeFromParentViewController()
        content.didMove(toParentViewController: containerVC)
        
//        self.window?.rootViewController = content
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

