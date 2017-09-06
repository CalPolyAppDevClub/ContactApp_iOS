//
//  RegistrationHandler.swift
//  ContactApp
//
//  Description: Handles the registration communication.
//  Created by Joe Durand on 8/28/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//
import UIKit
import Foundation
import FirebaseDatabase

class RegistrationHandler {
    
    let firebaseURL = Secrets.FirebaseURL
    
    var userData : [String : Any] = [:]

    func sendUserInfo(_ completion: @escaping (_ message: String, _ success: Bool) -> Void) {
        
        let ref = Database.database().reference(fromURL: firebaseURL)
        
        if let key = userData["EmailAddress"] as? String
        {
            let sanitizedEmail = key.replacingOccurrences(of: ".", with: "<dot>")
            ref.child(sanitizedEmail).setValue(userData)
            completion("Successful", true)
        }
        else
        {
            completion("There was a problem. Please try again.", false)
        }
        
    }
    
    func resetUserInfo() {
        self.userData = [:]
    }
    
    func addUserInfo(key: String, value: Any) {
        userData.updateValue(value, forKey: key)
    }
}

func getRegistrationHandler() -> RegistrationHandler? {
    if let delegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
        return delegate.theRegistrationHelper
    }
    else {
        return nil
    }
}
    
