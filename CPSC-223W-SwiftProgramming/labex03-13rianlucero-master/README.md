# MonthText
Create a unit test for the MonthText mobile application. Specifically, your unit test will test the Month structure.

## Month expected behaviors
1. It has a property called number
1. It has a property observer for number that ensures number’s value is always from 1 to 12. Otherwise, it keeps its old value.
1. It provides a computed property called name that returns the corresponding month name. For example, 1 is January, 2 is February, and so forth. 
1. It has a custom initializer that does not accept any parameters, but sets the number to 1.
1. It has another custom initializer that accepts a single integer value that is assigned to the number property. If it is an invalid value (not from 1 to 12), then set the number to 1. The custom initializer omits the variable name (i.e., var myMonth = Month(2))

# Instructions
1. Create your unit tests inside [MonthTextTests/MonthTextTests.swift](MonthTextTests/MonthTextTests.swift).
1. Your unit tests must test all expected behaviors of the Month structure.
1. Run your unit test. Fix any issues you might see with the Month structure.

Hint: You can look at your test's code coverage to help you figure out if you have fully tested the Month structure.
