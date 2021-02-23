# PhoneBook

Create a mobile application that represents a step in the creation of a phone book. The application already provides an interface that will ask the user for their name, email, and phone number. It provides an `Add contact` button that will add the contact and then show a screen displaying their information.

Your task is to create the Contact class as described below. Please take note that the class, property, function and parameter names are important. You need to use the exact name and it is case-sensitive. We need this for the unit tests to run correctly.

## Contact
Please implement the following properties and instance methods inside [PhoneBook/Contact.swift](PhoneBook/Contact.swift).

### Properties
1. name: An optional String that stores the name of the contact.
1. email: An optional String that stores the email of the contact.
1. phoneNumber: An optional Int that stores the number of the contact.

### Methods
1. init: A failable Initializer that accepts values for all properties: name, email, and phoneNumber. Take note that all three properties are optional. The initializer should check whether a non-nil name is provided, otherwise the initializer will return nil. It will also check if either email or phoneNumber is nil. When both are nil, then the initializer will return nil. If the initializer receives a name and at least an email or phoneNumber, it will set the parameter values to the corresponding properties.
