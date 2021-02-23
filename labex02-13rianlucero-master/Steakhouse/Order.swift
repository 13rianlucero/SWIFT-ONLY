import Foundation

// Place code here

struct Order {
    var customerName: String
    var tableNumber: Int
    var orders: Int
    var preparedOrders: Int
    var status: String {                                
        get {                                                     
            var curr_status: String = "In preparation"  
            if orders == preparedOrders {
                curr_status = "Complete"
            } 
            return curr_status
        }
    }
    
    init(customerName: String , tableNumber: Int, orders: Int){
        
            self.tableNumber = tableNumber
            self.customerName = customerName
            self.preparedOrders = 0
            self.orders = orders
        
      }
    
}
