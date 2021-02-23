import Foundation

// Place code here

struct SteakSupply {                                                    
    var message: String
    var numSteaks: Int {
        willSet(new_numSteaks) {                                        // willset checks BEFORE value is changed                    
            if new_numSteaks < 20 {
                message = "Steak supply is low. You need to restock."
            }
        }
        didSet {                                                        // didset checks AFTER value is changed
            if numSteaks > oldValue {
                var difference = numSteaks - oldValue
                message = "Steak supply restocked with \(difference) steaks."
            }
        }         // The didSet observer does not provide a custom parameter name for the old value,
    }             // and the default name of oldValue is used instead.

    
    
    init(numSteaks : Int){
        self.numSteaks = numSteaks
        self.message = ""
    }

}
