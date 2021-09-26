//
//  AppDelegate.swift
//  NerdFlix
//
//  Created by BootCamp on 24/09/21.
//

import UIKit
import netfox


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NFX.sharedInstance().start()
        
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

