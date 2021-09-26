//
//  AppDelegate.swift
//  NerdFlix
//
//  Created by BootCamp on 24/09/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = SeeMoreViewController()
        let navigationController = UINavigationController.init(rootViewController: viewController)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
     
        
        return true
    }
}

