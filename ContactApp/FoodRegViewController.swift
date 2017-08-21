//
//  FoodRegViewController.swift
//  ContactApp
//
//  Description: allows the user to specify their food preferences
//
//  Created by Joe Durand on 8/29/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class FoodRegViewController: ContactFormViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoritePizza: UITextField!
    @IBOutlet weak var favoriteSoda: UITextField!
     @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup title
        titleLabel.text = Constants.ContactForm.foodPrefs.favoriteFoodPrompt
        
        //setup pizza field
        favoritePizza.placeholder = Constants.ContactForm.foodPrefs.favoritePizzaPlaceholder
        
        //setup drink field
        favoriteSoda.placeholder = Constants.ContactForm.foodPrefs.favoriteDrinkPlaceholder
        
        //setup next button
        nextButton.layer.cornerRadius = Constants.buttonRadius
        nextButton.contentEdgeInsets = Constants.buttonInsets
        nextButton.setTitle(Constants.ContactForm.nextButtonText, for: UIControlState())
    }
   
    @IBAction func nextButton(_ sender: UIButton) {
        if let regHandler = getRegistrationHandler() {
            
            //save pizza preference
            if let pizza = favoritePizza.text {
                regHandler.addUserInfo(key: "FavoritePizza", value: pizza)
            }
            
            //save drink preference
            if let drink = favoriteSoda.text {
                regHandler.addUserInfo(key: "FavoriteDrink", value: drink)
            }
        }
        
        performSegue(withIdentifier: "showSubmitScreen", sender: self)
    }
}
