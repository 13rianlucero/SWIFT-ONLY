# Steakhouse

# Practice problem 1: Order
Create a structure called Order inside [Steakhouse/Order.swift](Steakhouse/Order.swift). It has four properties:

1. customerName - String
2. tableNumber - Int
3. orders - Int
4. preparedOrders - Int

Create a computed property called status that returns a String. When orders is equal to the preparedOrders, the status should return "Complete", which simulates the case when the kitchen
completes all the orders. Otherwise, the status should return "In preparation".

# Practice problem 2: SteakSupply
Create a structure called SteakSupply inside [Steakhouse/SteakSupply.swift](Steakhouse/SteakSupply.swift). It has two properties:

1. message - String
1. numSteaks - Int

Create two property observers for the numSteaks property. Before the value of numSteaks is changed, it should check whether the newValue will be less than 20. If it is below 20 then it
should change the value of the message property to "Steak supply is low. You need to restock."

After the numSteaks property is changed, the observer should check whether the numSteaks value has increased. If it increased, it should display the message "Steak supply restocked with x steaks."
where x is the number of steaks added to the supply. For example, if there used to be 10 steaks and it was changed to 15, then the message should indicate that five steaks were added.

# Main problem
Create a mobile application that will simulate the cooking of steaks in a steakhouse. The application already provides an interface that will ask the user to "Cook" the meat and will display information about the meat's weight, internal temperature and doneness.

Your task is to create a Steak structure. Please take note that the names are important. You need to use the exact name and it is case-sensitive. We need this for the unit tests to run correctly.

## Steak
Please implement the following properties and instance methods inside [Steakhouse/Steak.swift](Steakhouse/Steak.swift).

### Properties
1. uncookedWeight: Represents the weight of the steak in ounces.
1. internalTemperature: Represents the temperature of the steak in Fahrenheit.
1. doneness: A computed property that returns a String representing the doneness of the meat. Refer to the table below to identify the String that will be returned.
1. cookedWeight: A computed property that returns the weight of the meat accordding to its doneness. This is also measured in ounces. See the tble below to identify the formula for computing the meat's cooked weight from its uncooked weight.

| Internal temperature | Doneness    |
|----------------------|-------------|
| 0 to less than 125   | Uncooked    |
| 125 to less than 135 | Rare        |
| 135 to less than 145 | Medium rare |
| 145 to less than 150 | Medium      |
| 150 to less than 160 | Medium well |
| 160 to less than 170 | Well done   |
| over 170             | Burnt       |


| Doneness    | Cooked Weight           |
|-------------|-------------------------|
| Uncooked    | same as uncooked weight |
| Rare        | 95% of uncooked weight  |
| Medium rare | 90% of uncooked weight  |
| Medium      | 85% of uncooked weight  |
| Medium well | 80% of uncooked weight  |
| Well done   | 75% of uncooked weight  |
| Burnt       | 70% of uncooked weight  |

### Instance method
cook: Increase the steak's internal temperature by 5 degree Fahrenheit.
