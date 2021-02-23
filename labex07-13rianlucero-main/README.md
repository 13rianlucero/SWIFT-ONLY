# BudgetAllocator

Create a mobile application that is used to allocate your budget to five categories: home, transportation, groceries, dining, and entertainment. The application already provides an interface that will ask the user to allocate the budget (in percentages like 10, 20 or 30).

Your task is to create the BudgetCategory enumeration and BudgetManager structure as described below. Please take note that the struct, property, function and parameter names are important. You need to use the exact name and it is case-sensitive. We need this for the unit tests to run correctly.

## BudgetCategory
Create an enumeration with the following cases:
- home
- transportation
- groceries
- dining
- entertainment

## BudgetManager
Please implement the following properties and instance methods inside [BudgetAllocator/BudgetManager.swift](BudgetAllocator/BudgetManager.swift).

### Properties
1. allocation: A dictionary whose key is a BudgetCategory and value is a Double
1. runningTotal: A Double with a computed property. The value is computed by adding all values in the allocation property. For example, if .home is set to 10 and .groceries is set to 30 then it should return 40. 

### Methods
1. init: An initializer that sets allocation to an empty dictionary
1. allocate: A function that accepts two parameters (category and amount) and returns a Bool. The data type for category should be the BudgetCategory enum, while amount uses a Double. The function assigns the amount to the corresponding category in the allocation dictionary. However, take note that the new amount should not cause the runningTotal to exceed 100. Use a guard to ensure runningTotal does not exceed 100. Take note that the initial value of the category should not change if the runningTotal exceeds 100. For example, assume the initial value of .home is 40 that is changed to 90 and results in a runningTotal of 110. As runningTotal exceeds 100, the value of .home should stay at 40.
