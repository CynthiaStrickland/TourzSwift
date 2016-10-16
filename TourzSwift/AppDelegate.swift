//
//  AppDelegate.swift
//  TourzSwift
//
//  Created by Cynthia Whitlatch on 10/14/16.
//  Copyright © 2016 Cynthia Sinclair. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        FIRDatabase.database().persistenceEnabled = true

        return true
    }
    
    func applicationWillTerminate(application: UIApplication) {
        self.saveContext()
    }

}

