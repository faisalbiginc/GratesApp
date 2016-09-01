//
//  LoginViewController.swift
//  Grates
//
//  Created by Irtiza Mahmood on 8/24/16.
//  Copyright © 2016 Irtiza Mahmood. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController , FBSDKLoginButtonDelegate , GIDSignInDelegate , GIDSignInUIDelegate {

  //* ---------------  Variables and Outlets --------------------------------

    @IBOutlet weak var usernameTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var loginButtonProperty: UIButton!
    
    
    //* ----------------- Facebook and Google Signin Button  ------------------
    
    var loginButton = FBSDKLoginButton()
     let GoogleSigninButton = GIDSignInButton(frame: CGRectMake(0 , 0, 100, 50))
    
 //* ---------------  Actions --------------------------------
    
    @IBAction func loginButtonAction(sender: UIButton) {
           }
    
 @IBAction func gotoSignupAction(sender: UIButton) {
    }
    
 override func viewDidLoad() {
        super.viewDidLoad()

    //*----------- Google Pluse Button on Login Page ------------------
    
    
    GoogleSigninButton.frame = CGRectMake(180, 530, 0, 0)
    
    view.addSubview(GoogleSigninButton)

    GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
     GIDSignIn.sharedInstance().delegate = self
    GIDSignIn.sharedInstance().uiDelegate = self

     // Facebook Button   myFirstButton.frame = CGRectMake(15, -50, 300, 500)
    
        self.loginButton.frame = CGRectMake(60, 533, 110, 40)
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self
        self.view!.addSubview(loginButton)
}

 func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
    
    if error != nil {
        
            print(error)
             return
   }
    
    
    print(user.profile.email)
    print(user.profile.imageURLWithDimension(400))
    
    
        
//        if let error = error {
//        
//            print(error.localizedDescription)
//        }
//        
//        
//        let authentication = user.authentication
//        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken, accessToken: authentication.accessToken)
//        
//        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
//            
//            if error != nil {
//                
//                print(error!.localizedDescription)
//                return
//            }
//            else {
//            
//                print(user?.email)
//            
//            }
//            
//            
//       
//            
//            
//          
//            
//     
//        })
    }
    
   func signIn(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
        
        if let error = error {
            
            print(error.localizedDescription)
            
        }
        
        
            try! FIRAuth.auth()?.signOut()

    }
 
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged IN")
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged OUTTTTT")
    }


}
