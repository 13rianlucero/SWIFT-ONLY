# Grocery Cart

Create a mobile application that represents a grocery cart in a dollar store. The application already provides an interface that will ask the user for the item and it's quantity. It provides an Add button that will add the item to the cart. It also provides a Checkout button that prints the items and the total amount.

Your task is to create the Cart structure/class as described below. Please take note that the class, property, function and parameter names are important. You need to use the exact name and it is case-sensitive. We need this for the unit tests to run correctly.

## Cart
Please implement the following properties and instance methods inside [GroceryCart/Cart.swift](GroceryCart/Cart.swift).

### Properties
1. items: A dictionary with String keys and Int values that store the items in the cart.
1. totalItems: A computed property that returns the total number of items in the cart. Take note that some items may have a quantity greater than one.
1. printOut: A computed property that returns a String that shows the items in the cart. Each item should be on it's own line separated by a \n. The format for outputting an item is &lt;Item name: Quantity&gt;. For example: `Apple Juice: 1\nSack of rice: 1\n`
### Methods
1. init(): Initializes the item dictionary to an empty dictionary.
1. add(): Accepts two parameters: the name of the item and the quantity of the item. Omit the argument label for the item's name. For example, the method can be called by: `cart.add("Apple", quantity: 5)`
