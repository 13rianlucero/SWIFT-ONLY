//
//  ContactViewController.swift
//  PhoneBook
//
//  Created by Paul Inventado on 10/3/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    var contact: Contact!
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var EmailLabel: UILabel!
    @IBOutlet var PhoneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NameLabel.text = contact.name
        if let theEmail = contact.email {
            EmailLabel.text = theEmail
        } else {
            EmailLabel.text = "Not provided"
        }
        if let thePhone = contact.phoneNumber {
            PhoneLabel.text = String(thePhone)
        } else {
            PhoneLabel.text = "Not provided"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
