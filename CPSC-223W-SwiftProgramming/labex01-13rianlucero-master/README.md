# Restaurant Bill

Create a mobile application that computes the restaurant bill. The application already provides an interface that will ask the user for the meal's cost and the tip percentage. It provides a Calculate Bill button that will start the computation. The results will be shown in the corresponding fields in the application.

Your task is to create three functions inside [Computation.swift](Restaurant/Computation.swift). Please take note that the function and parameter names are important. You need to use the exact name and it is case-sensitive. We need this for the unit tests to run correctly.

1. tip - Accepts two Double parameters and returns a Double value. The first parameter is named subTotal and the second is named tipPercentage. The tip is computed by multiplying the subTotal with the tipPercentage. Take note that tipPercentage values range from 0.0 to 1.0
2. taxes - Accepts one Double parameter and returns a Double value. The first parameter is named subTotal. The taxes are computed by multiplying the subTotal by 7.5%.
3. total - Accepts two Double parameters and returns a Double value. The first parameter is named subTotal and the second is named tipPercentage. The function returns the total bill which is the subTotal plus the tip and taxes. Hint: You can use your other functions to compute this value.
