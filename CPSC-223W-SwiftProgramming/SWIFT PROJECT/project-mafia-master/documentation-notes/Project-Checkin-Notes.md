# Project-Checkin-Notes

- contains the notes summarizing what was discussed during the check-ins with paul.

# check-in 1

> **10/15/2020 notes during Zoom lecture meeting:**
> - We agreed on a general design for the project and pushed some of the starting code to the github master branch in the very beginning
> - limited communication created a slow divided start to the project
> - two main ways that the start of the project has been done:

> 1. Angel and brian worked on creating a game project from the swift templates. 
> this way utilizes:
> - spritekit
> - already has a character animation
> - uses the directional arrow buttons on the screen to move the character

> 2. Fahad and brian worked on creating the project more from scratch
this way utilizes:
> - more hands on, writing our own functions rather than the built in stuff from swift
> - doesnt use any of the kits from swift
> - has a square as the character animation
> - tapping on certain part of the screen indicates where to the character will move
> - character can move in any direction on the screen, basically just closes the gap/distance between the character and finger tap
> - has no directional arrows

> Discussed about the two different methods:
> - agreed on moving forward with angel/brians version as the base project folder
> - implemented the character movement functionality from fahad/brians version (touch on screen to move the character to that location of the screen)

> Brainstorming on whetheror
> 1. to include the character feature still 
> 2. leave behind the character feature and focus more on having a main screen with different games to choose from
> - after some conversation we decided to build both alongside each other. 
> - the focus should be on making a game project (each of us make our own game to implement)

> **Moving forward:**
> 1. each of us create our own game project file
> - as soon as you create the starter file, commmit all the files to your github branch

> 2. 
> However, we should focus more on building the individual games. 

# check-in 2

**## PROJECT CHECK-IN #2  |  Thursday, October 29, 2020  |  CPSC-223W Swift**

**#### Since the last project check-in, the new goal was:**
> - to fix and re-organize the github branches and version control of the files to avoid the mess of files and pull request issues from last time.
> **B completed**
> 
> - implement a system of branches that allows us to be able to test new code while also ensuring old code does not get deleted by accident (version control system improvement) 
> **B completed**
> 
> - to create the functionality of a player character being able to hover over a game icon **FAB completed**
> 
> - small window pops up asking the user to confirm yes, they would like to play the game they are hovering over or the option not to “no”.
> **FAB completed**
> 
> - if the user selects no, then the window will disappear, if the user selects yes then a new screen appears and loads the game they want to play
> **FAB completed**
> 
> - also has the functionality of allowing the user to press a “back” button to return to the main screen
> **FAB completed**

**#### As a follow-up task to getting the functionality stated above to work:**
> The next task for each team member was to begin writing the code to a specific game that the user could play when hovering over the square. 
    
**Brian:**
    - decided to make a slot machine style game if we make it that far
    - started to look into other potential games (poker, blackjack implementations and ideas)

**Angel:** 
    - decided that he wanted to create the roulette wheel game
    

**Fahad:** 
    - decided on including some games he made in a different CPSC class.


# check-in 3



# check-in 4
**1. Identify a project that can be implemented in Swift. **
     *- casino arcade app*

**2. Write a design document that will guide the development of the project.**
  *- included in documentation folder*

**3. Design and write code that makes appropriate use of fundamental programming constructs and data structures (e.g., expressions, conditions, loops, user-defined functions, primitive data types).**
     *- each game of the 3 utilizes these programming constructs*

**4. Design and write code that makes appropriate use of object-oriented concepts (e.g., classes, objects, methods, composition, and inheritance).**
     *- each game makes use of classes and objects*

**5. Design and write code that makes appropriate use of advanced programming concepts (e.g., error handling).**
     *- angels "roulette game" makes use of error handling, so that the user cannot type in a string                when entering the bet amount*

**6. Write code that follows coding standards.**
     *- our code in all of the files, follows the coding standards that we know of currently*

**7. Write appropriate comments that help other developers understand and reuse code.**
     *- each file has a good amount of comments to explain to other programmers how to reuse or              or access and understand certain features (however still may need more*

**8.** Design unit tests to evaluate the project’s correctness and completeness.
     *- Unit tests have been created for each of the 3 games by each of us, and some unit tests for                the game overall*

**9. Analyze and interpret compilation errors, unit test results, and code behavior to debug code.**
     *- Much testing has taken place to make sure that the user wallet is functioning properly*

**10. Write code that utilizes programming-language constructs and software libraries from documentation.**
     *- the group has researched into multiple libraries to make the complex features easier to create*
