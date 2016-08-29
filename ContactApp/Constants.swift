//
//  Constants.swift
//  ContactApp
//
//  Description: Contains constants used throughout the app.
//
//  Created by Joe Durand on 8/27/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let buttonInsets = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
    static let buttonRadius = CGFloat(15)
    
    struct Welcome {
        static let title = "Glad you could join us."
        static let message = "define message in constants"
        static let nextButtonText = "Register"
    }
    
    struct ContactForm {
        static let nextButtonText = "Next"
        
        
        static let namePrompt = "What's your name?"
        static let firstNameFieldPlaceholder = "First Name"
        static let lastNameFieldPlaceholder = "Last Name"
        
        static let emailPrompt = "What's your email address?"
        static let emailFieldPlaceholder = "Email Address"
        static let emailInvalidTitle = "Invalid Email"
        static let emailInvalidMessage = "That email address isn't valid. Please try again!"
        
        static let classLvlPrompt = "What is your class standing?"
        static let classLevels = ["Freshman","Sophomore","Junior","Senior",
                            "Super Senior","Graduate Student"]
        static let classLevelImages = [UIImage(named: "freshman"),
                                       UIImage(named: "sophomore"),
                                       UIImage(named: "junior"),
                                       UIImage(named: "senior"),
                                       UIImage(named: "supersenior"),
                                       UIImage(named: "graduate")]
        
        struct platforms {
            static let platformPrompt = "What platforms are you interested in?"
            
            static let optionOneLabel = "Android?"
            static let optionOneYesImage = UIImage(named: "androidYES")
            static let optionOneNoImage = UIImage(named: "androidNO")
            
            static let optionTwoLabel = "iOS?"
            static let optionTwoYesImage = UIImage(named: "appleYES")
            static let optionTwoNoImage = UIImage(named: "appleNO")
            
            static let optionThreeLabel = "Windows Phone?"
            static let optionThreeYesImage = UIImage(named: "windowsYES")
            static let optionThreeNoImage = UIImage(named: "windowsNO")
            
            static let optionFourTextLabel = "Anything else?"
        }
        
    }

    struct Services {
        static let registrationURL = "https://polyapp.azurewebsites.net/tables/UserItem"
    }
}