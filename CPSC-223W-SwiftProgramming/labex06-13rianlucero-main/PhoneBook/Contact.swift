import Foundation

// Please provide your code here
class Contact {
    var name: String?
    var email: String?
    var phoneNumber: Int?
    
    init?( name: String?, email: String?, phoneNumber: Int? ) {
        if name == nil {
            return nil
        } else if email == nil && phoneNumber == nil {
            return nil
        }
    
        if email == nil {
            self.name = name
            self.name = nil
            self.phoneNumber = phoneNumber
        } else {
            self.name = name
            self.email = email
            self.phoneNumber = nil
        }
    }
 }

