//
//  TemPMainEventsController.swift
//  Grates
//
//  Created by Irtiza Mahmood on 8/29/16.
//  Copyright © 2016 Irtiza Mahmood. All rights reserved.
//

import UIKit
import Firebase

class TemPMainEventsController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            performSelector(#selector(handleLogout), withObject: nil, afterDelay: 0)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(handleLogout))
    }
    
    func handleLogout() {
        
        let ref = FIRDatabase.database().referenceFromURL("https://grates-8ecd8.firebaseio.com/")
        ref.updateChildValues(["SomeValue" : 213444])
        
        
         }
}
