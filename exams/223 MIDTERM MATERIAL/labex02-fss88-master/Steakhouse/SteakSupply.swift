import Foundation

// Place code here

struct SteakSupply {
    
    var message : String
    var numSteaks : Int {
        willSet{
            if newValue < 20 {
                message = "Steak supply is low. You need to restock."
            }
        }
        didSet {
        if numSteaks > oldValue {
            let x = numSteaks - oldValue
            message = "Steak supply restocked with \(x) steaks."
            }
        }
        
    }
    
    
    
    init(numSteaks : Int){
        self.message = ""
        self.numSteaks = numSteaks
    }
    

}
    

