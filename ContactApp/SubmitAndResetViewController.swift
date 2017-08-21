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
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    var progressValue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup title field
        titleLabel.text = Constants.SubmitReset.submittingLabel
        
        //setup activity indicator
        activityIndicator.hidesWhenStopped = true
        
        //setup progress bar
        
        //submit user info
        submitInformation()
    }
    
    func submitInformation() {
        activityIndicator.startAnimating()
        
        if let regHandler = getRegistrationHandler() {
            regHandler.sendUserInfo({msg, success in
                
                if success {
                    DispatchQueue.main.async {
                        //update UI
                        self.titleLabel.text = Constants.SubmitReset.submittedLabel
                        self.messageLabel.text = Constants.SubmitReset.submittedMessage
                        self.activityIndicator.stopAnimating()
                    }
                    
                    //reset registraton handler
                    if let regHandler = getRegistrationHandler() {
                        regHandler.resetUserInfo()
                    }
                    
                    Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(SubmitAndResetViewController.transitionToStart), userInfo: nil, repeats: false)
                }
                else {
                    DispatchQueue.main.async {
                        let notification = UIAlertController(title: Constants.SubmitReset.errorTitle, message: Constants.SubmitReset.errorMessage, preferredStyle: .actionSheet)
                        notification.addAction(UIAlertAction(title: Constants.SubmitReset.errorAction, style: .default, handler: {action in
                            self.submitInformation()
                        }))
                        self.present(notification, animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
    func transitionToStart() {
        performSegue(withIdentifier: "showWelcomeScreen", sender: self)
    }
}

