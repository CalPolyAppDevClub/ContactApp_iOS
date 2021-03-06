//
//  ClassLvlRegViewController.swift
//  ContactApp
//
//  Description: Allows the user to input their class level.
//
//  Created by Joe Durand on 8/27/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class ClassLvlRegViewController: ContactFormViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var classLevelImage: UIImageView!
    @IBOutlet weak var classLevelLabel: UILabel!
    @IBOutlet weak var classLevelSlider: UISlider!
    @IBOutlet weak var nextButton: UIButton!
    
    let sliderValues = Constants.ContactForm.classLvl.classLevels
    let sliderImages = Constants.ContactForm.classLvl.classLevelImages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup title
        titleLabel.text = Constants.ContactForm.classLvl.classLvlPrompt
        
        //setup slider
        classLevelSlider.maximumValue = Float(sliderValues.count - 1)
        
        //setup class level label
        updateClassLevel()
        
        //setup next button
        nextButton.layer.cornerRadius = Constants.buttonRadius
        nextButton.contentEdgeInsets = Constants.buttonInsets
        nextButton.setTitle(Constants.ContactForm.nextButtonText, for: UIControlState())
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateClassLevel()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if let regHandler = getRegistrationHandler(), let answer = classLevelLabel.text {
            regHandler.addUserInfo(key: "ClassStanding", value: answer)
        }
        
        performSegue(withIdentifier: "showPlatformInputScreen", sender: nil)
    }
    
    func updateClassLevel() {
        let sliderValue = Int(classLevelSlider.value)
        
        if sliderValue >= 0 && sliderValue < sliderValues.count {
            classLevelLabel.text = sliderValues[sliderValue]
            classLevelImage.image = sliderImages[sliderValue]
        }
        else {
            classLevelLabel.text = "(Sorry, something went wrong)"
            classLevelImage.image = nil
        }
        
        classLevelLabel.setNeedsDisplay()
        classLevelImage.setNeedsDisplay()
    }
}
