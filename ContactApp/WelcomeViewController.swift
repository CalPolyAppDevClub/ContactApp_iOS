//
//  WelcomeViewController.swift
//  ContactApp
//
//  Description: Welcomes the user to the registration process.
//
//  Created by Joe Durand on 8/27/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImage = UIImage(named: "CalPolyBG_Blurred")
        let bgView = UIImageView(frame: view.frame)
        bgView.image = bgImage
        bgView.contentMode = .scaleAspectFill
        view.addSubview(bgView)
        view.sendSubview(toBack: bgView)
        view.setNeedsDisplay()
        
        //setup title
        titleLabel.text = Constants.Welcome.title
        
        //setup message
        messageLabel.text = Constants.Welcome.message
        
        //setup next button
        nextButton.layer.cornerRadius = Constants.buttonRadius
        nextButton.contentEdgeInsets = Constants.buttonInsets
        nextButton.setTitle(Constants.Welcome.nextButtonText, for: UIControlState())
    }
    @IBAction func nextButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showNameInputScreen", sender: nil)
    }
}
