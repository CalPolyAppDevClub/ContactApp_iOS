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
        var emptyField: UITextField?
        
        //check and save last name
        if let lastname = lastNameField.text where !lastname.isEmpty {
            regHandler?.lastName = lastname
        }
        else {
            emptyField = lastNameField
        }
        
        //check and save first name
        if let firstname = firstNameField.text where !firstname.isEmpty {
            regHandler?.firstName = firstname
        }
        else {
            emptyField = firstNameField
        }
        
        //if field is empty, prompt user. otherwise continue.
        if let field = emptyField {
            let msg = UIAlertController(title: Constants.ContactForm.name.requiredTitle, message: Constants.ContactForm.name.requriedMessage, preferredStyle: .Alert)
            msg.addAction(UIAlertAction(title: "Try Again", style: .Default, handler: {_ in
                dispatch_async(dispatch_get_main_queue()) {
                    field.becomeFirstResponder()
                }
            }))
            presentViewController(msg, animated: true, completion: nil)
        }
        else {
            self.performSegueWithIdentifier("showEmailInputScreen", sender: nil)
        }
    }
}