import Foundation

// brian lucero
// lab #5
// started on 9/29/2020


struct Cart {

    var items: [String: Int]

    var totalItems: Int
    {
        let numItems = Array(items.values)
        var amt = 0
        
        for num in numItems
        {
            amt += num
        }
        return amt
    }

    var printOut: String
    {
        var itemList = ""
        for (name, quantity) in items
        {
            itemList += "\(name): \(quantity)\n"
        }
        return itemList
    }

    init()
    {
        items = [:]
    }

    mutating func add(_ name: String, quantity: Int)
    {
        if let nameOfItem = items[name] {
            items[name] = nameOfItem + quantity
        } else {
            items[name] = quantity
        }
    }
}
