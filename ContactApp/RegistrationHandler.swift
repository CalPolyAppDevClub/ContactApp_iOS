//
//  RegistrationHandler.swift
//  ContactApp
//
//  Description: contains information that makes up a email registration record.
//  Created by Joe Durand on 8/28/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import Alamofire

class RegistrationHandler {
    
    var firstName: String = ""
    var lastName: String = ""
    var emailAddress: String = ""
    var url: String = "nil"
    var classStanding: String = ""
    var InterestediOS: Bool = false
    var InterestedAndroid: Bool = false
    var InterestedWindows: Bool = false
    var InterestedOther: String = ""
    var FavoritePizza: String = ""
    var FavoriteSoda: String = ""
    
    func registerUser(completion: (message: String, success: Bool) -> Void) {
        print("registering...")
        if let requestBody = createRegistrationRequest() as? [String: AnyObject] {
            print("request generated...")
            Alamofire.request(.POST, Constants.Services.registrationURL, parameters: requestBody, encoding: .JSON, headers: ["zumo-api-version" : "2.0.0", "Content-Type" : "application/json"])
                .responseJSON(completionHandler: {response in
                    completion(message: response.result.description, success: response.result.isSuccess)
                })
        }
        else {
            completion(message: "Unable to create the request.", success: false)
        }
    }
    
    func createRegistrationRequest() -> NSDictionary? {
        if  !firstName.isEmpty &&
            !lastName.isEmpty &&
            !emailAddress.isEmpty &&
            !classStanding.isEmpty {
            
            let params = ["url" : self.url,
                         "email" : self.emailAddress,
                         "lastName" : self.lastName,
                         "firstName" : self.firstName,
                         "classStanding" : self.classStanding,
                         "InterestediOS" : self.InterestediOS,
                         "InterestedAndroid" : self.InterestedAndroid,
                         "InterestedWindows" : self.InterestedWindows,
                         "InterestedOther" : self.InterestedOther,
                         "FavoritePizza" : self.FavoritePizza,
                         "FavoriteSoda" : self.FavoriteSoda]
            return params
        }
        else {
            return nil
        }
    }
    
    func resetUserInfo() {
        self.firstName = ""
        self.lastName = ""
        self.emailAddress = ""
        self.url = ""
        self.classStanding = ""
        self.InterestediOS = false
        self.InterestedAndroid = false
        self.InterestedWindows = false
        self.InterestedOther = ""
        self.FavoritePizza = ""
        self.FavoriteSoda = ""
    }
}

func getRegistrationHandler() -> RegistrationHandler? {
    if let delegate: AppDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
        return delegate.theRegistrationHelper
    }
    else {
        return nil
    }
}
    