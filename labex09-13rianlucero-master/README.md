# Guessing Game

Create a mobile application that simulates a guessing game. The application allows the user to ask for clues so they can get the pattern from the series of clues and guess the next value. For example, if the clues you get are 2, 4, 6, 8, 10 you can probably guess that the next value will be 12. The pattern in this case is even numbers.

The application already provides an interface that will ask the user to request clues, make a guess, save the game and reset the game. Your task is to create a Guessable protocol, create a structure that implements the Guessable protocol, and implement file saving and loading. Please take note that the struct, property, function and parameter names are important. You need to use the exact name and it is case-sensitive. We need this for the unit tests to run correctly.

Please implement the following properties and instance methods inside [GuessingGame/GameManager.swift](GuessingGame/GameManager.swift).

## Guessable protocol
Create a protocol that will be used to generate clues and check guesses for a secret word. The protocol should enforce the following functions.

1. init: An initializer with no parameters to allow the instance to be created easily.
1. getClue: A mutating function without parameters that generates a clue that is represented as a String.
1. guess: A mutating function that takes a String parameter and returns a Bool value. The parameter should use an omitted argument label representing the guess. It returns true if the guess is ccorrect and false otherwise.

## Guessable structure
Create a structure that implements the Guessable protocol. There are two Guessable structures you can take a look at for reference: EvenNumbers and RainbowColors. You will need to create at least one more structures that implements the Guessable protocol. 

1. Use init to initialize any properties you'll need for your guess generator.
1. Implement getClue so that it generates patterns. Expect that getClue will be called multiple times so it should return a different string every time. For example, if the pattern you choose is generating even numbers, then the first time it is called it might return 2, then it returns 4, and so forth.
1. Implement guess so that it checks whether the guess matches the next value in the series. Using the same example, if the previous clues were 2 and 4, then guess would check if the guess is equal to the next value in the pattern, 6. 

## Game structure
Most of the Game structure has already been implemented for you. However, you will need to complete some of the code.

It is a great idea to read and understand the GameHistory class first. It is a structure that stores information about the user's progress.

### init
The initializer should try to load a file called game.plist using the PropertyListDecoder. If it exists, then it should load the file into a GameHistory instance. This should be assigned to the history property of the structure. If the file does not exist, then create a GameHistory instance using its default initializer (no parameter initializer) and assign it to the history property.

### save
Store the history property into a file called game.plist using the PropertyListEncoder.

### getGenerator
Modify the function by changing the range from 1 to the number of Guessables in the file. For example, if you add one Guessable structure then the range should change to 1...3. Also add new cases in the switch block that would return an instance of your Guessable structure.
