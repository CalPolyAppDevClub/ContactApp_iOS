//
//  ServiceHelper.swift
//  ContactApp
//
//  Description: Provides a basis for sending POST requests
//
//  Created by Joe Durand on 8/5/2015
//  Copyright © 2016 Joe Durand. All rights reserved.
//

import Foundation
import UIKit

class ServiceAgent: NSObject {
    
    var session: NSURLSession?
    
    ////////////////////////////////////////////////////////////////////////////////
    //MARK: SERVICE CORE
    
    /**
     Initialize a ServiceAgent
     - Author: Joe Durand
     */
    override init() {
        let urlconfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        urlconfig.timeoutIntervalForRequest = 10
        urlconfig.timeoutIntervalForResource = 10
        self.session = NSURLSession(configuration: urlconfig)
    }
    
    /**
     Get the service existing in appdelegate.
     - Author: Joe Durand
     */
    class func currentService() -> ServiceAgent
    {
        if let delegate: AppDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            if let service = delegate.coreService {
                return service
            }
            else {
                delegate.coreService = ServiceAgent()
                return delegate.coreService!
            }
        }
        else {
            return ServiceAgent()
        }
    }
    
    /**
     The standard post request used by calls to Services.
     - Author: Joe Durand
     - parameters:
     - request: JSON Request to be sent to service
     - url: The URL to send the request to
     - completion: the method to be called on completion
     - returns:
     - *Returns via completion handler:
     - data: JSON packet if successful, nil otherwise.
     - error: error if unsuccessful, nil otherwise.
     */
    func postRequest(requestParams: JSON, url: String, completion: ((data: JSON?, error: NSError?) -> Void)) {
        
        //BUILD THE REQUEST
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //add JSON data to the request itself
        //try to parse JSON request into HTTP request
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(requestParams, options: .PrettyPrinted)
        }
        catch {
            //if unable to parse request, return error
            completion(data: nil, error: Constants.Errors.requestParsingError)
        }
        
        //CREATE REQUEST AND RESPONSE HANDLER
        let task = session!.dataTaskWithRequest(request) {data, rawresponse, error in
            
            //if error exists, return error
            if (error != nil) {
                
                if error?.code == -1002 || error?.code == -1009 {
                    completion(data: nil, error: Constants.Errors.connectionError)
                }
                completion(data: nil, error: error!)
            }
            else
            {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! JSON
                    completion(data: json, error: nil)
                }
                catch {
                    completion(data: nil, error: Constants.Errors.responseParsingError)
                }
            }
        }
        task.resume()
    }
}