//
//  SignUpViewController.swift
//  Grates
//
//  Created by Irtiza Mahmood on 8/24/16.
//  Copyright © 2016 Irtiza Mahmood. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate  {

    @IBOutlet weak var userNameTextBox: UITextField!
    @IBOutlet weak var userEmailTextBox: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userDisplayNameLabel: UILabel!
    @IBOutlet weak var logoutButtonProperty: UIButton!
    
    @IBOutlet weak var userImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //checkUserLoginOrLogout()
        
        userImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlerSelectProfileImageView)  ))
        
        userImageView.userInteractionEnabled = true
    }

    func handlerSelectProfileImageView(){
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        print("Canceled picker")
        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            userImageView.image = selectedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
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
                guard let uid = user?.uid else {return}
            
            
  let imageName = NSUUID().UUIDString
            
            // Save Profile image in Storage in Firebase 
                        
            let storageRef = FIRStorage.storage().reference().child("User_Images").child("\(imageName).png")
            
            if let uploadData = UIImagePNGRepresentation(self.userImageView.image!) {
            
            storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                
                
                if error != nil {
                    
                    print(error)
                }
                
                if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                
                let values = ["name" : name , "email" : userEmail , "profileImageUrl" :profileImageUrl]
                     self.registerUserIntoDatabasewithUID(uid, values: values)
                    
                }

                 
               
                
            })
            
            }
        })
   
    }

    
    
    
    
    
    func registerUserIntoDatabasewithUID(uid : String , values : [String: AnyObject]) {
        
        
        
        let ref = FIRDatabase.database().referenceFromURL("https://grates-8ecd8.firebaseio.com/")
    
        
          let userRefernce = ref.child("users").child(uid)
        
        userRefernce.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                
                print(err)
            }
            
            print("User Saved in Database")
            
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
    
    
    
    
       
    
    
    
    
    
   
    
    
    

}




























