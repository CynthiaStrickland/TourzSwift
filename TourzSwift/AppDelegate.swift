//
//  AppDelegate.swift
//  TourzSwift
//
//  Created by Cynthia Whitlatch on 10/14/16.
//  Copyright © 2016 Cynthia Sinclair. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        return true
    }

}

