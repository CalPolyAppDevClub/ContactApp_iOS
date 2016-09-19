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
        static let message = "We have a lot of cool stuff going on this year, and we're glad you'd like to get involved!"
        static let nextButtonText = "Register"
    }
    
    struct ContactForm {
        static let nextButtonText = "Next"
        
        struct name {
            static let namePrompt = "What's your name?"
            static let firstNamePlaceholder = "First Name"
            static let lastNamePlaceholder = "Last Name"
            static let requiredTitle = "Required"
            static let requriedMessage = "You left a required field blank."
        }
        
        struct email {
            static let emailPrompt = "What's your email address?"
            static let emailFieldPlaceholder = "What's your email address?"
            static let emailInvalidTitle = "Invalid Email"
            static let emailInvalidMessage = "That email address isn't valid. Please try again!"
        }
        
        struct classLvl {
            static let classLvlPrompt = "What is your class standing?"
            static let classLevels = ["Freshman","Sophomore","Junior","Senior",
                                      "Super Senior","Graduate Student"]
            static let classLevelImages = [UIImage(named: "freshman"),
                                           UIImage(named: "sophomore"),
                                           UIImage(named: "junior"),
                                           UIImage(named: "senior"),
                                           UIImage(named: "supersenior"),
                                           UIImage(named: "graduate")]
        }
        
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
        
        
        struct foodPrefs {
            static let favoriteFoodPrompt = "Now the important stuff..."
            static let favoritePizzaPlaceholder = "Favorite Pizza?"
            static let favoriteDrinkPlaceholder = "Favorite Drink?"
        }
    }
    
    struct SubmitReset {
        
        static let submittingLabel = "Submitting..."
        static let submittedLabel = "Thank You!"
        
        static let submittedMessage = "Your information has been received."
        
        static let errorTitle = "Whoops!"
        static let errorMessage = "There was a problem submitting your information. Please try again."
        static let errorAction = "Try Again"
        
        
    }

    struct Services {
        static let registrationURL = "https://polyapp.azurewebsites.net/tables/UserItem"
    }
}