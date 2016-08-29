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



    struct Errors {
        static let requestParsingError = NSError(domain: "CALPOLYAPPDEV", code: 42, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Parsing Error", value: "Unable to create request.", comment: "")])
        static let responseParsingError = NSError(domain: "CALPOLYAPPDEV", code: 42, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("Parsing Error", value: "Unable to interpret response.", comment: "")])
        static let connectionError = NSError(domain: "MBSAPP", code: 23, userInfo: [NSLocalizedDescriptionKey :  NSLocalizedString("No Connection", value: "There seems to be a problem with your internet connection.", comment: "")])
    }
}