# PPE Factory
PPE factory is an [incremental game](https://en.wikipedia.org/wiki/Incremental_game) that simulates the production and purchase of personal protective equipment (PPE). The goal of the game is to get the fastest production time (orders per second).

Your factory produces alcohol, gloves, and masks every 0.2 seconds. It starts by producing one of each item every 0.2 seconds. Every 0.001 seconds a new order comes in that consists of an item and quantity. If your factory has enough of the item then the order is fulfilled. Specifically, your supply is reduced by the quantity of the order and you are paid for the order.

To speed up your production, you can upgrade your item production speed. This increases the multiplier so that instead of producing 1 glove per 0.2 seconds, for example, it might now produce 2 or 3. The price for the upgrade increases over time. For example, initially the cost for upgrading is $2, but then it increases to $4, $9, and so forth. Also take note that the upgrade cost will be subtracted from the budget so you will need to wait for enough money before completing an upgrade.

## Implementation
You are already provided the skeleton code for the game. You need to complete and implement four functions in the  Factory class that is detailed inside [PPEFactory/Factory.swift](PPEFactory/Factory.swift). You will be applying your knowledge of passing closures as arguments and creating functions that accept closures as parameters.

You will also need to learn to use Timer's scheduledTimer function. Feel free to search over the internet or start with these resources:

- [Apple documentation](https://developer.apple.com/documentation/foundation/timer/2091889-scheduledtimer)
- [Hacking with Swift](https://www.hackingwithswift.com/articles/117/the-ultimate-guide-to-timer) (refer to the example that uses closures)

