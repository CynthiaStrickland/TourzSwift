//  PasswordResetViewController.swift
//  Book Club
//
//  Created by Cynthia Whitlatch on 12/31/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PasswordResetViewController: UIViewController {
    
    
    let buttonBorder = UIColor.whiteColor().CGColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).CGColor
    
    let ref = FIRDatabase.database().reference()

    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func changePasswordPressed(sender: AnyObject) {
        let userInput = emailAddress.text
        
        if userInput == "" {
            let alertView = UIAlertController(title: "Error", message: "A valid email is required" as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "Try Again!", style: .Default, handler: nil)
            alertView.addAction(okAction)
            self.presentViewController(alertView, animated: true, completion: nil)
        
        } else {
    
                FIRAuth.auth()?.sendPasswordResetWithEmail(userInput!) { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                        
                        return
                    }
                    
                    print("success")
            }
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        }
    
    func customButtons() {
        emailAddress.layer.borderColor = buttonBorder
        emailAddress.layer.backgroundColor  = buttonColor
        emailAddress.layer.borderWidth = 1
        emailAddress.layer.cornerRadius = 10
        
        sendButton.layer.borderColor = buttonBorder
        sendButton.layer.backgroundColor  = buttonColor
        sendButton.layer.borderWidth = 1
        sendButton.layer.cornerRadius = 10
    }
    }


