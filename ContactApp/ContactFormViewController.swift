//
//  ContactFormViewController.swift
//  ContactApp
//
//  Description: Provides a contact form for
//  Created by Joe Durand on 8/28/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class ContactFormViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgImage = UIImage(named: "CalPolyBG_Blurred")
        let bgView = UIImageView(frame: view.frame)
        bgView.image = bgImage
        bgView.contentMode = .scaleAspectFill
        bgView.alpha = 0.4
        view.addSubview(bgView)
        view.sendSubview(toBack: bgView)
        view.setNeedsDisplay()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ContactFormViewController.dismissKeyboard)))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
