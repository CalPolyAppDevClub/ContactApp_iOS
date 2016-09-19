//
//  PlatformRegViewController.swift
//  ContactApp
//
//  Description: Allows the user to specify what mobile platforms they are
//          interested in.
//  Created by Joe Durand on 8/28/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class PlatformRegViewController: ContactFormViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //option outlets
    @IBOutlet weak var optionOneImage: UIImageView!
    @IBOutlet weak var optionOnePrompt: UILabel!
    @IBOutlet weak var optionOneSwitch: UISwitch!
    @IBOutlet weak var optionTwoImage: UIImageView!
    @IBOutlet weak var optionTwoPrompt: UILabel!
    @IBOutlet weak var optionTwoSwitch: UISwitch!
    @IBOutlet weak var optionThreeImage: UIImageView!
    @IBOutlet weak var optionThreePrompt: UILabel!
    @IBOutlet weak var optionThreeSwitch: UISwitch!
    @IBOutlet weak var optionTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup title
        titleLabel.text = Constants.ContactForm.platforms.platformPrompt
        
        //setup options
        optionOnePrompt.text = Constants.ContactForm.platforms.optionOneLabel
        updateOptionOneImage()
        optionTwoPrompt.text = Constants.ContactForm.platforms.optionTwoLabel
        updateOptionTwoImage()
        optionThreePrompt.text = Constants.ContactForm.platforms.optionThreeLabel
        updateOptionThreeImage()
        optionTextField.placeholder = Constants.ContactForm.platforms.optionFourTextLabel
        
        //setup next button
        nextButton.layer.cornerRadius = Constants.buttonRadius
        nextButton.contentEdgeInsets = Constants.buttonInsets
        
    }
    
    @IBAction func optionToggled(sender: UISwitch) {
        if let ident = sender.accessibilityIdentifier {
            switch ident {
                case "android":
                    updateOptionOneImage()
                break
                case "ios":
                    updateOptionTwoImage()
                break
                case "windows":
                    updateOptionThreeImage()
                break
            default: break
            }
        }
    }
    
    func updateOptionOneImage() {
        optionOneImage.image = optionOneSwitch.on ? Constants.ContactForm.platforms.optionOneYesImage : Constants.ContactForm.platforms.optionOneNoImage
        optionOneImage.setNeedsDisplay()
    }
    
    func updateOptionTwoImage() {
        optionTwoImage.image = optionTwoSwitch.on ? Constants.ContactForm.platforms.optionTwoYesImage : Constants.ContactForm.platforms.optionTwoNoImage
        optionTwoImage.setNeedsDisplay()
    }
    
    func updateOptionThreeImage() {
        optionThreeImage.image = optionThreeSwitch.on ? Constants.ContactForm.platforms.optionThreeYesImage : Constants.ContactForm.platforms.optionThreeNoImage
        optionThreeImage.setNeedsDisplay()
    }
    
    
    @IBAction func nextButton(sender: AnyObject) {
        
        if let regHandler = getRegistrationHandler() {
            regHandler.InterestedAndroid = optionOneSwitch.on
            regHandler.InterestediOS = optionTwoSwitch.on
            regHandler.InterestedWindows = optionThreeSwitch.on
            
            if let txt = optionTextField.text {
                regHandler.InterestedOther = txt
            }
        }
        
        performSegueWithIdentifier("showFoodInputScreen", sender: self)
        
    }
    
}
