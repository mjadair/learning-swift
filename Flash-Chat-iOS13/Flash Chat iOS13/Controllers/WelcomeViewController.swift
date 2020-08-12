//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = "⚡️FlashChat"
        
        
        

   /*
         // USING A FOR LOOP TO HAVE A TYPING EFFECT WITHOUT 3rd PARTY LIBRARY
         
         // emptying out our title label
        titleLabel.text = ""
        
        var charIndex = 0.0
        
        // setting an initial value for our title
        let titleText: String = "⚡️FlashChat"
        
        // looping through the titleText and adding it incrementally for a fun typing effect
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            
            charIndex += 1
            
        }
       */
    }
    

}
