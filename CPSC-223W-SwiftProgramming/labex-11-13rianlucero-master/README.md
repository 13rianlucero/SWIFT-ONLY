# Vending Machine

Create a mobile application that simulates a vending machine. The application allows the user to deposit coins that they use to buy Candy Bars, Chips, or Pretzels. The application already provides an interface that the user can use to interact with the vending mahcine.

Your task is to create a VendingMachine class that stores information about the vending machine. It implements a vend method that uses error handling to throw errors. You are to also modify the ViewController so that it catches errors when calling the vend method and display the errors on the interface accordingly.

Please implement the VendingMachine class and buy method inside [VendingMachine/VendingMachine.swift](VendingMachine/VendingMachine.swift) and [VendingMachine/ViewController.swift](VendingMachine/ViewController.swift) accordingly.

Please take note that the class, property, method and parameter names are important. You need to use the exact name and it is case-sensitive. We need this for the unit tests to run correctly.

## VendingMachine
Create the VendingMachine class with the following properties and methods.

### Properties
1. inventory: A dictionary with a String key and an Item value. The Item struct is already provided for you. Hard code the following values into the dictionary either directly when you create the property or inside your initializer.
    
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
1.  coinsDeposited: An int that stores the number of coins in the machine. 

### Methods
Create a vend method that accepts a String parameter called itemNamed. The method does not return anything but throws an exception. Take note that the exceptions that are thrown are members of the VendingMachineError enum which are described below.

1. VendingMachineError.invalidSelection: Thrown when the name of the item bought is not in the inventory.
1. VendingMachineError.insufficientFunds: Thrown when there are not enough coins to buy a given item (based on its price).
1. VendingMachineError.outOfStock: Thrown when there are no items available to purchase (based on its count).

If there are no exceptions, the method should reduce the coinsDeposited by the price of the item purchased, and reduce the count of the item in the inventory by 1.

## ViewController
Complete the buy method so that it will call the vend method and pass in the item name. It should use do-catch to handle all three exceptions that can be thrown. If it catches an exception, it should modify the text of the  errorLabel to show an error message. You are free to create your own error message.
