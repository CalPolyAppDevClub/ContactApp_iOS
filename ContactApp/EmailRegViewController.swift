//
//  EmailRegViewController
//  ContactApp
//
//  Description: Allows the user to input their email address.
//
//  Created by Joe Durand on 8/27/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class EmailRegViewController: ContactFormViewController {
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var emailInputField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup title
        titleField.text = Constants.ContactForm.email.emailPrompt
        
        //setup email field
        emailInputField.placeholder = Constants.ContactForm.email.emailFieldPlaceholder
        emailInputField.delegate = self
        
        //setup next button
        nextButton.layer.cornerRadius = Constants.buttonRadius
        nextButton.contentEdgeInsets = Constants.buttonInsets
        nextButton.setTitle(Constants.ContactForm.nextButtonText, forState: .Normal)
        
        //setup keyboard dismissal
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NameRegViewController.dismissKeyboard)))
    }
    
    func emailAddressIsValid() -> Bool {
        if let txt = emailInputField.text {
            return txt.containsString(".") && txt.containsString("@")
        }
        return false
    }
    
    @IBAction func nextButton(sender: UIButton) {
        
        if emailAddressIsValid() {
            self.performSegueWithIdentifier("showClassLvlInputScreen", sender: nil)
        }
        else {
            let msg = UIAlertController(title: Constants.ContactForm.email.emailInvalidTitle, message: Constants.ContactForm.email.emailInvalidMessage, preferredStyle: .Alert)
            msg.addAction(UIAlertAction(title: "Try Again", style: .Default, handler: {_ in
                self.emailInputField.becomeFirstResponder()
            }))
            presentViewController(msg, animated: true, completion: nil)
        }
    }
    
    //TODO: Validate email field before continuing
}