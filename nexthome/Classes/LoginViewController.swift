//
//  LoginViewController.swift
//  nexthome
//
//  Created by Eric Seo on 3/15/16.
//  Copyright © 2016 Eric Seo and Smith Chung. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAnAccountButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(image: UIImage(named: "loginBackground"))
        backgroundImage.frame = self.view.frame
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        let usernameIconImage = UIImageView(image: UIImage(named: "User"))
        usernameIconImage.frame.size.width = 23
        usernameIconImage.frame.size.height = 30
        usernameTextField.leftViewMode = UITextFieldViewMode.Always
        usernameTextField.leftView = usernameIconImage
        
        let passwordIconImage = UIImageView(image: UIImage(named: "Lock"))
        passwordIconImage.frame.size.width = 23
        passwordIconImage.frame.size.height = 30
        passwordTextField.leftViewMode = UITextFieldViewMode.Always
        passwordTextField.leftView = passwordIconImage
        
        
        //Adding object to parse
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            print("Object has been saved.")
//        }
        
//        let testObject2 = PFObject(className: "User")
//        testObject2["username"] = "test"
//        testObject2["password"] = "test"
//        testObject2.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            print("saved.")
    }
    
}
