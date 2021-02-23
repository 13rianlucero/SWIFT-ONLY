import Foundation

// Place code here

struct Order {
    
    var customerName : String
    var tableNumber : Int
    var orders : Int
    var preparedOrders :Int
    
  init(customerName: String , tableNumber: Int, orders: Int){
        self.customerName = customerName
        self.tableNumber = tableNumber
        self.orders = orders
        self.preparedOrders = 0
    }
    
    var status : String{
        
        if self.preparedOrders == self.orders {
            return "Complete"
        }else{
           return "In preparation"
        }
                
    }
    
}
