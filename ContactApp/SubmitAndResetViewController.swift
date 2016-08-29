//
//  SubmitAndResetViewController.swift
//  ContactApp
//
//  Description: responsible for submitting the user's information and resetting
//          the kiosk for the next user.
//
//  Created by Joe Durand on 8/29/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class SubmitAndResetViewController: ContactFormViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var timerProgress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup title field
        titleLabel.text = Constants.SubmitReset.submittingLabel
        
        //setup activity indicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        //setup progress bar
        
        if let regHandler = getRegistrationHandler() {
            regHandler.registerUser({msg, success in
                
                if success {
                    self.titleLabel.
                }
                
            })
        }
    }
}

