import Foundation

// Place code here


struct Steak{
    
    var uncookedWeight: Double
    var internalTemperature: Double
        
    var doneness : String {
        
        switch internalTemperature{
        case 0..<125:
            return  "Uncooked"
        case 125..<135:
            return "Rare"
        case 135..<145:
            return  "Medium rare"
        case 145..<150:
            return  "Medium"
        case 150..<160:
            return "Medium well"
        case 160..<170:
            return "Well done"
        default:
            return "Burnt"
        }
        
    }
    
    var cookedWeight: Double {
        
        
        switch doneness{
        case "Uncooked":
            return uncookedWeight
        case "Rare":
            return 0.95*uncookedWeight
        case "Medium rare":
            return  0.90*uncookedWeight
        case "Medium":
            return 0.85*uncookedWeight
        case "Medium well":
            return 0.80*uncookedWeight
        case "Well done":
            return  0.75*uncookedWeight
        case "Burnt":
            return 0.70*uncookedWeight
        default:
            return uncookedWeight
        }
        
        
    }

    
    init(uncookedWeight: Double, internalTemperature: Double){
              self.uncookedWeight = uncookedWeight
              self.internalTemperature = internalTemperature
          }
    
    mutating func cook(){
        internalTemperature += 5;
    }
    
    
} //struct done
