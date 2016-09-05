//
//  SignUpViewController.swift
//  Grates
//
//  Created by Irtiza Mahmood on 8/24/16.
//  Copyright © 2016 Irtiza Mahmood. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var userNameTextBox: UITextField!
    @IBOutlet weak var userEmailTextBox: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userDisplayNameLabel: UILabel!
    @IBOutlet weak var logoutButtonProperty: UIButton!
    
    @IBOutlet weak var userImageView: UIImageView!
   
    
    @IBAction func userProfileImagePickerAction(sender: AnyObject) {
        
        
        self.handlerSelectProfileImageView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //checkUserLoginOrLogout()
        
    }
    
    
    
    
    func checkUserLoginOrLogout(){
        
        
        
    }

    
    @IBAction func registerUserInFirebaseAction(sender: AnyObject) {
        
        handleRegistration()
    }
    
    
    func handleRegistration(){
        
        guard let userEmail = userEmailTextBox.text , userPassword = userPasswordTextField.text, name = userNameTextBox.text else {
        print("Form not valid")
            return
        }
        
        FIRAuth.auth()?.createUserWithEmail(userEmail, password: userPassword, completion: { (user : FIRUser?, error) in
            
            if error != nil {
                print("error : User cannot be created")
                return
            }
            
            // Successfully Authenticate USer now save in Database
            
            let ref = FIRDatabase.database().referenceFromURL("https://grates-8ecd8.firebaseio.com/")
            guard let uid = user?.uid else {return}
            
            let userRefernce = ref.child("users").child(uid)
            let values = ["name" : name , "email" : userEmail]

            userRefernce.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil {
                
                    print(err)
                }
                
                print("User Saved in Database")
 
            })
      
        })
   
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    
//    
//    
//    /**  -------------------------------------------------------
//     
//     - Action : Signup Process With Register Button
//     
//     -------------------------------------------------------
//     */
//
//    
//    @IBAction func registerUserInFirebaseAction(sender: AnyObject) {
//        
//        
//        
//        
//        if userNameTextBox.text == "" || userEmailTextBox.text == "" || userPasswordTextField.text == ""{
//            
//            let alertController = UIAlertController(title:"OOPs" , message: "Enter Username Email and Password", preferredStyle: .Alert)
//            let defaultAction = UIAlertAction(title: "Thanks", style: .Cancel, handler: nil)
//            alertController.addAction(defaultAction)
//            self.presentViewController(alertController, animated: true, completion: nil)
//            
//        } else {
//            
//            FIRAuth.auth()?.createUserWithEmail(userEmailTextBox.text!, password: userPasswordTextField.text!, completion: { (user, error) in
//                
//                if error == nil {
//                    
//                   
//                    self.userNameTextBox.text = user?.email
//                    
//                    // Clear All Field
//                    
//                    self.userDisplayNameLabel.text = ""
//                    self.userEmailTextBox.text = ""
//                    self.userPasswordTextField.text = ""
//                    
//                    
//                    
//                    // Upload Profile picture and Display name to Firebase 
//                    
//                    
//                    
//                    
//                                      
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                } else
//                    
//                {
//                    // Give Notice
//                    
//                    let alertController = UIAlertController(title:"OOPs" , message: error?.localizedDescription, preferredStyle: .Alert)
//                    let defaultAction = UIAlertAction(title: "Thanks", style: .Cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//                    self.presentViewController(alertController, animated: true, completion: nil)
//                    
//                }
//                
//            })
//        }
//        
//    }
//    
    
    
//    /**  -------------------------------------------------------
//     
//     - Action : Signin Process With Login Button
//     
//     -----------------------------------------------------------
//     */
//
//    @IBAction func userLoginButtonAction(sender: AnyObject) {
//        
//        if userNameTextBox.text == "" || userEmailTextBox.text == "" || userPasswordTextField.text == ""{
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
//                    
//                    self.logoutButtonProperty.alpha = 1.0
//                    self.userNameTextBox.text = user?.email
//                    
//                    // Clear All Field
//                    
//                    self.userDisplayNameLabel.text = ""
//                    self.userEmailTextBox.text = ""
//                    self.userPasswordTextField.text = ""
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
//
//        
//               }
    



//
//    /**  -------------------------------------------------------
//     
//     - Action : Signin Process With Login Button
//     
//     -----------------------------------------------------------
//     */
//    
//    @IBAction func logoutUserAction(sender: AnyObject) {
//        
//       try! FIRAuth.auth()?.signOut()
//        logoutButtonProperty.alpha = 0.0
//        self.userDisplayNameLabel.text = ""
//        self.userEmailTextBox.text = ""
//        self.userPasswordTextField.text = ""
//        
//        
//    }
    
    /**  -------------------------------------------------------
     
     - Action : image picker handler
     
     -----------------------------------------------------------
     */
    
    
    
    
       
    
    
    
    
    
    
    func handlerSelectProfileImageView(){
        
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        
        
        
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
    print("Canceled picker")
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
 
        var selectedImageFromPicker : UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {

            selectedImageFromPicker = editedImage
        
        }
        
        if let selectedImage = selectedImageFromPicker {
        
            userImageView.image = selectedImage
        
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

}




























