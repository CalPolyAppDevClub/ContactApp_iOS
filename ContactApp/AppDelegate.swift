//
//  AppDelegate.swift
//  ContactApp
//
//  Created by Joe Durand on 8/27/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var theRegistrationHelper: RegistrationHandler?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //create the registration helper to store user information and make the
        //    registration server request.
        theRegistrationHelper = RegistrationHandler()
        
        return true
    }
}

