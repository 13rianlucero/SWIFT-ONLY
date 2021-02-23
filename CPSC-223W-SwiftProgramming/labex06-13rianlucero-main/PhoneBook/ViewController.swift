//
//  ViewController.swift
//  PhoneBook
//
//  Created by Paul Inventado on 10/3/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ErrorLabel: UILabel!
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var PhoneTextField: UITextField!
    
    var contact : Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AddContactPressed(_ sender: Any) {
        var name: String? = nil
        var email: String? = nil
        var phone: Int? = nil
        
        if let temp = NameTextField.text {
            if temp != "" {
                name = temp
            }
        }
        
        if let temp = EmailTextField.text {
            if temp != "" {
                email = temp
            }
        }
        
        if let temp = PhoneTextField.text {
            if let numTemp = Int(temp) {
                phone = numTemp
            }
        }
        if let contact = Contact(name: name, email: email, phoneNumber: phone) {
            self.contact = contact
            print(contact)
            ErrorLabel.text = ""
            performSegue(withIdentifier: "AddContact", sender: nil)
        } else {
            ErrorLabel.text = "Invalid contact."
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let theContact = self.contact {
            segue.destination.navigationItem.title = theContact.name
            if let target = segue.destination as? ContactViewController {
                target.contact = self.contact
            }
        }
    }
}

