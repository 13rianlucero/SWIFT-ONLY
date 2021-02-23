import Foundation


enum BudgetCategory{
  case home
  case transportation
  case groceries
  case dining
  case entertainment
}


struct BudgetManager{
    var allocation: [BudgetCategory: Double]
     
    var runningTotal: Double {
        var temp = 0.0
        for (key, value) in allocation{
            temp += value
        }
        return temp
    }
     
    init() {
        allocation = [:]
    }
    
    mutating func allocate(category: BudgetCategory, amount: Double) -> Bool {
            guard amount > allocation[category] ?? 0.0 else {
                allocation.updateValue(amount, forKey: category)
                return true
            }
            
            guard (amount - (allocation[category] ?? 0.0) + runningTotal)>100 else {
                allocation.updateValue(amount, forKey: category)
                return true
            }
            return false
    }
}

