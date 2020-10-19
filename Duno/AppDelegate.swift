//
//  AppDelegate.swift
//  Duno
//
//  Created by Davi Bispo on 19/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var window: UIWindow?
    var rootNavigationController: UINavigationController {
        return window!.rootViewController as! UINavigationController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootNavigationController = UINavigationController()
        let mainViewController = MainViewController()
        rootNavigationController.viewControllers = [mainViewController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = rootNavigationController
        window!.makeKeyAndVisible()
        return true
    }
}

