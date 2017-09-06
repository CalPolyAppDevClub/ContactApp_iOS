//
//  SetupViewController.swift
//  ContactApp
//
//  Created by Joe Durand on 9/5/17.
//  Copyright © 2017 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class SetupViewController : UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
}
