//
//  LoginViewController.swift
//  Grates
//
//  Created by Irtiza Mahmood on 8/24/16.
//  Copyright © 2016 Irtiza Mahmood. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    
    
    
    
    
    @IBOutlet weak var usernameTextBox: UITextField!
    
    
    @IBOutlet weak var passwordTextBox: UITextField!
    
    
    
    @IBOutlet weak var loginButtonProperty: UIButton!
    
    
    
    @IBAction func loginButtonAction(sender: UIButton) {
        let user = User()
        user.userName = "Faisal"
        user.userPassword = "abcdef"
        print("Username \(user.userName) and Password")
    }
    
    
    
    
    @IBAction func gotoSignupAction(sender: UIButton) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
