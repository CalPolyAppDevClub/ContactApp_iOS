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
    }
   
    @IBAction func nextButton(sender: UIButton) {
        if let regHandler = getRegistrationHandler() {
            
            //save pizza preference
            if let txt = favoritePizza.text {
                regHandler.FavoritePizza = txt
            }
            
            //save drink preference
            if let txt = favoriteSoda.text {
                regHandler.FavoriteSoda = txt
            }
        }
        
        performSegueWithIdentifier("showSubmitScreen", sender: self)
    }
}