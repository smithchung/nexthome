//
//  SignUpViewController.swift
//  nexthome
//
//  Created by Kevin Seo on 3/20/16.
//  Copyright © 2016 Eric Seo and Smith Chung. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(image: UIImage(named: "loginBackground"))
        backgroundImage.frame = self.view.frame
        self.view.insertSubview(backgroundImage, atIndex: 0)
    }
    
    @IBAction func createAnAccount() {
        if (isValidEmail() && isValidUserName() && isValidPassword()) {
            let newUser = PFObject(className: "User")
            newUser["username"] = usernameTextField.text
            newUser["password"] = passwordTextField.text
            newUser["email"] = emailTextField.text
            newUser.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if success {
                    NSLog("User created with id: %@", newUser.objectId!)
                    self.dismissViewControllerAnimated(true, completion: {})
                } else {
                    NSLog("%@", error!)
                }
            }
        } else {
            let alert = UIAlertController(title: "Invalid Credentials", message: "Please enter a valid email, username, password, and make sure your passwords match", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(emailTextField.text)
    }
    
    func isValidUserName() -> Bool {
        // check if user name have minimum characters, is only alphanumeric /w no spaces
        if (usernameTextField.text?.characters.count >= 4) {
            return true
        }
        return false
    }
    
    func isValidPassword() -> Bool {
        // check if password has minimum 8 characters, and if password and password confirmation match
        if ((passwordTextField.text?.characters.count >= 8) && (passwordTextField.text == confirmPasswordTextField.text)) {
            return true
        }
        return false
    }
}