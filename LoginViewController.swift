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

    
    
    
    @IBOutlet weak var userDisplayName: UILabel!
    
    @IBAction func userProfileView(sender: AnyObject) {
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
  //* ---------------  Variables and Outlets --------------------------------


    @IBOutlet weak var loginButtonProperty: UIButton!
    
    @IBOutlet weak var userEmailTextBox: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    //* ----------------- Facebook and Google Signin Button  ------------------
    
    var loginButton = FBSDKLoginButton()
     let GoogleSigninButton = GIDSignInButton(frame: CGRectMake(0 , 0, 100, 50))
    
 //* ---------------  Actions --------------------------------
    
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

    
    
    
    
      // ---------------------- Login with Email ----------------------
    
    
    
    
    
    
    
    
    
    
      }
    
    
 
 func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
    
    if error != nil {
        
            print(error)
             return
   }
    
    
    print(user.profile.email)
    print(user.profile.imageURLWithDimension(400))
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


    
    /**  -------------------------------------------------------
     
     - Action : Signin Process With Login Button
     
     -----------------------------------------------------------
     */
    
    
    
    func getUserInfo() {
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            print("NOt loged in")
        }
        
        
        else {
            
            
            let uid = FIRAuth.auth()?.currentUser?.uid
            
            print(uid)
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                   self.userDisplayName.text = dictionary["name"] as? String
                    print(dictionary["name"] as? String)
                }
                
                }, withCancelBlock: nil)
        }
    }
        
    


    
    @IBAction func userLoginButtonAction(sender: AnyObject) {
        
        guard let userEmail = userEmailTextBox.text , userPassword = userPasswordTextField.text else {
            print("Form not valid")
            return
        }
        
        FIRAuth.auth()?.signInWithEmail(userEmail, password: userPassword, completion: { (user, error) in
            
            if error != nil {
                print("error")
                return
            }

            // Login Successful

            print("Sign in")
            
            
            
            
            
            
            
            
            
            
            
          self.getUserInfo()
            
            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewControllerWithIdentifier("SignUpViewController") as UIViewController
//            self.presentViewController(vc, animated: true, completion: nil)
//            
//            
            
        
            
        })
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        if userEmailTextBox.text == "" || userPasswordTextField.text == ""{
//            
//            let alertController = UIAlertController(title:"OOPs" , message: "Enter Username Email and Password", preferredStyle: .Alert)
//            let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
//            alertController.addAction(defaultAction)
//            self.presentViewController(alertController, animated: true, completion: nil)
//            
//            
//        } else {
//            
//            FIRAuth.auth()?.signInWithEmail(userEmailTextBox.text!, password: userPasswordTextField.text!, completion: { (user, error) in
//                
//                if error == nil {
//                    
//                    // OK
//                print("User Login Successfull")
//                    
//                } else
//                    
//                {
//                    // Problem here
//                    
//                    let alertController = UIAlertController(title:"OOPs" , message: error?.localizedDescription, preferredStyle: .Alert)
//                    let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//                    self.presentViewController(alertController, animated: true, completion: nil)
//                    
//                }
//            })
//            
//        }
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
