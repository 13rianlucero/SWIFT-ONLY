import Foundation

// Place your code here

func tip(subTotal: Double, tipPercentage: Double) -> Double {
    var percent = tipPercentage
    if (tipPercentage > 1) {
        percent = tipPercentage / 100
    } 
    return subTotal * percent
}

// function #2: taxes
func taxes(subTotal: Double) -> Double {
    let taxRate = 0.075     // 7.5 percent tax
    return subTotal * taxRate
}

// function #3: total
func total(subTotal: Double, tipPercentage: Double) -> Double {
    let tipamt = tip(subTotal: subTotal, tipPercentage: tipPercentage)   // calculates tip
    let tax = taxes(subTotal: subTotal)                               // calculates taxes  
    let grandTotal = subTotal + tipamt + tax                            // sums up for grand total
    return grandTotal
}
