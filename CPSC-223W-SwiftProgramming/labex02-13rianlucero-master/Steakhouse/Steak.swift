import Foundation

// Place code here

struct Steak {
   
    var uncookedWeight: Double              // in ounces
    var internalTemperature: Double 
    
    var doneness: String {
        get {
            var it = internalTemperature 
            var d: String                   // holder variable for doneness
            switch it {
                case 0..<125:
                    d = "Uncooked"
                case 125..<135:
                    d = "Rare"
                case 135..<145:
                    d = "Medium rare"
                case 145..<150:
                    d = "Medium"
                case 150..<160:
                    d = "Medium well"
                case 160..<170:
                    d = "Well done"
                default:
                    d = "Burnt"
            }
            return d
        }
    }

    var cookedWeight: Double {
        get {
            var d: String = doneness
            var cw: Double = uncookedWeight 
            switch d {
                case "Uncooked":
                    cw *= 1
                case "Rare":
                    cw *= 0.95
                case "Medium rare":
                    cw *= 0.90
                case "Medium":
                    cw *= 0.85
                case "Medium well":
                    cw *= 0.80
                case "Well done":
                    cw *= 0.75
                case "Burnt":
                    cw *= 0.70
                default: 
                    cw *= 1
            }
            return cw
        }
    }


    init(uncookedWeight: Double, internalTemperature: Double){
        
        self.internalTemperature = internalTemperature
        self.uncookedWeight = uncookedWeight
        
    }
    
    // Instance Method:
    mutating func cook() {
        internalTemperature += 5
    }

    // (?) unsure if cook method is supposed to return a value or not (?)

} // end of struct
