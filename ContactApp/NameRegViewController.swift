//
//  NameRegViewController.swift
//  ContactApp
//
//  Description: Allows the user to input their name.
//
//  Created by Joe Durand on 8/27/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class NameRegViewController: ContactFormViewController {
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup title
        titleField.text = Constants.ContactForm.name.namePrompt
        
        //setup first name field
        firstNameField.placeholder = Constants.ContactForm.name.firstNamePlaceholder
        firstNameField.delegate = self
        
        //setup first name field
        lastNameField.placeholder = Constants.ContactForm.name.lastNamePlaceholder
        lastNameField.delegate = self
        
        //setup next button
        nextButton.layer.cornerRadius = Constants.buttonRadius
        nextButton.contentEdgeInsets = Constants.buttonInsets
        nextButton.setTitle(Constants.ContactForm.nextButtonText, forState: .Normal)
        
        //setup keyboard dismissal
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NameRegViewController.dismissKeyboard)))
    }
    
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == firstNameField {
            lastNameField.becomeFirstResponder()
        }
        else if textField == lastNameField {
            dismissKeyboard()
        }
        return true
    }
    
    @IBAction func nextButton(sender: UIButton) {
        
        let regHandler = getRegistrationHandler()
        
        if let firstname = firstNameField.text {
            regHandler?.firstName = firstname
        }
        
        if let lastname = lastNameField.text {
            regHandler?.lastName = lastname
        }
        
        //TODO: Save Name data for later submission
        self.performSegueWithIdentifier("showEmailInputScreen", sender: nil)
    }
}