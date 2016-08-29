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
        titleField.text = Constants.ContactForm.namePrompt
        
        //setup email field
        emailInputField.placeholder = Constants.ContactForm.emailFieldPlaceholder
        emailInputField.delegate = self
        
        //setup next button
        nextButton.layer.cornerRadius = 10
        nextButton.setTitle(Constants.ContactForm.nextButtonText, forState: .Normal)
        
        //setup keyboard dismissal
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NameRegViewController.dismissKeyboard)))
    }
    
    @IBAction func nextButton(sender: UIButton) {
        self.performSegueWithIdentifier("showClassLvlInputScreen", sender: nil)
    }
    
    //TODO: Validate email field before continuing
}