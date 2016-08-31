//
//  LoginViewController.swift
//  Grates
//
//  Created by Irtiza Mahmood on 8/24/16.
//  Copyright © 2016 Irtiza Mahmood. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController , FBSDKLoginButtonDelegate {

  //* ---------------  Variables and Outlets --------------------------------

    @IBOutlet weak var usernameTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var loginButtonProperty: UIButton!
    var loginButton = FBSDKLoginButton()
    
        //* ---------------  Actions --------------------------------
    
    @IBAction func loginButtonAction(sender: UIButton) {
        let user = User()
        user.userName = "Faisal"
        user.userPassword = "abcdef"
        print("Username \(user.userName) and Password \(user.userPassword)")
    }
    
 @IBAction func gotoSignupAction(sender: UIButton) {
    }
    
 override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 // Optional: Place the button in the center of your view.
    
     //myFirstButton.frame = CGRectMake(15, -50, 300, 500)
    
        self.loginButton.frame = CGRectMake(60, 530, 110, 30)
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self
        self.view!.addSubview(loginButton)
}

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged IN")
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged OUTTTTT")
    }


}
