//
//  AppDelegate.swift
//  TourzSwift
//
//  Created by Cynthia Whitlatch on 10/14/16.
//  Copyright © 2016 Cynthia Sinclair. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        GMSServices.provideAPIKey("AIzaSyBxf_HKoQMBH5cZNP8hQ1D9Wn1weR7j_14")
        GMSPlacesClient.provideAPIKey("AIzaSyBxf_HKoQMBH5cZNP8hQ1D9Wn1weR7j_14")
        
        return true
    }

}

