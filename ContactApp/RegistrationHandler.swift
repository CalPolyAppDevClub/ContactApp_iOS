//
//  RegistrationHandler.swift
//  ContactApp
//
//  Description: Handles the registration communication.
//  Created by Joe Durand on 8/28/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import Alamofire
class RegistrationHandler {
    
    var userData : [String : Any] = [:]

    func sendUserInfo(_ completion: @escaping (_ message: String, _ success: Bool) -> Void) {
        Alamofire.request(Constants.Services.registrationURL, method: .post, parameters: userData, encoding: JSONEncoding.default, headers: ["zumo-api-version" : "2.0.0", "Content-Type" : "application/json"])
            .responseJSON(completionHandler: {response in
                completion(response.result.description, response.result.isSuccess)
            })
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
    
