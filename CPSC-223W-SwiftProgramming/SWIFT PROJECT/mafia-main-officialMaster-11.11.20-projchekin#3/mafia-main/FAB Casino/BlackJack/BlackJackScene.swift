//
//  BlackJackScene.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import SpriteKit
import GameplayKit

class BlackJackScene: SKScene {
    var cards = [Card]()
    let moneyPot = Pot()
    let player = Player(hand: Hand(),cash: Cash())
    let croupier = Croupier(hand: Hand())
    var playerType:BasePlayer = Player(hand: Hand(),cash: Cash())
    var dealerCardY = 800 // Y position of dealer cards
    var playerCardY = 200 // Y position of player cards
    
    override func didMove(to view: SKView) {
        setupBoard()
        setupCoins()
        setupButtons()
        playerType = player
        dealerCardY = Int(8*size.height/10)
        playerCardY = Int(2*size.height/10)
    }
    
    //Board Item
    let container = SKSpriteNode(color: .clear, size: CGSize(width:220, height: 200))
    let instruction = SKLabelNode(text: "PlAY GAME")
    let deck = Deck()
    //MARK: Set up Table and money container according to view Height
    func setupBoard(){
        let table = SKSpriteNode(imageNamed: "board")
        addChild(table)
        table.size = self.size
        table.position = CGPoint(x: size.width/2, y: size.height/2)
        table.zPosition = -1
        addChild(container)
        container.position = CGPoint(x:size.width/2 - 125, y:size.height/2 - 75)
        instruction.fontColor = UIColor.black
        addChild(instruction)
        instruction.position = CGPoint(x: size.width/2, y: size.height/2 - 100)
        deck.resetDeck()
    }
    
    //Money
    let ten = Coins(coinValue: .ten)
    let twentyFive = Coins(coinValue: .twentyFive)
    let fifty = Coins(coinValue: .fifty)
    //MARK: Set up money Coins
    func setupCoins(){
        addChild(ten)
        ten.position = CGPoint(x: size.width/10, y: size.height/25)
        addChild(twentyFive)
        twentyFive.position = CGPoint(x:size.width/10 + 55, y:size.height/25)
        addChild(fifty)
        fifty.position = CGPoint(x: size.width/10 + 110, y:size.height/25)
    }
    
    //Buttons
    let btnDeal = SKSpriteNode(imageNamed: "btnDeal")
    let btnHit = SKSpriteNode(imageNamed: "btnHit")
    let btnStand = SKSpriteNode(imageNamed: "btnStand")
    //MARK: Set up deal, hit and stand button
    func setupButtons(){
        btnDeal.name = "dealBtn"
        addChild(btnDeal)
        btnDeal.position = CGPoint(x:8*size.width/10, y:size.height/25)
        
        btnHit.name = "hitBtn"
        addChild(btnHit)
        btnHit.position = CGPoint(x:2*size.width/10, y:size.height/25)
        btnHit.isHidden = true
        
        btnStand.name = "standBtn"
        addChild(btnStand)
        btnStand.position = CGPoint(x:8*size.width/10, y:size.height/25)
        btnStand.isHidden = true
    }
    
    //MARK: get user interaction
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        let node = self.atPoint(location!)
        self.tableClick(node: node)
    }
    
    func tableClick(node: SKNode){
        if(node.name == "coins"){
            let money = node as! Coins
            add(betAmount: money.getCoinValue())
        }
        if(node.name == "dealBtn"){
            dealBtnAxn()
        }
        if(node.name == "hitBtn"){
            hitBtnAxn()
        }
        if(node.name == "standBtn"){
            standBtnAxn()
        }
    }
    
    //MARK: Add money in container
    func add(betAmount: CoinValue ){
        if(moneyPot.getMoney() > player.cash.getBalance()){
            let alert = UIAlertController(title: "Out Of Money", message: "You are out of money", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
            return
        }else{
            moneyPot.addMoney(amount: betAmount.rawValue)
            let tempMoney = Coins(coinValue: betAmount)
            tempMoney.anchorPoint = CGPoint(x:0, y:0)
            container.addChild(tempMoney)
            tempMoney.position = CGPoint(x:CGFloat(arc4random_uniform(UInt32(container.size.width - tempMoney.size.width))), y:CGFloat(arc4random_uniform(UInt32(container.size.height - tempMoney.size.height))))
            btnDeal.isHidden = false;
        }
    }
    
    //MARK: Deal btn axn
    func dealBtnAxn() {
        instruction.text = ""
        ten.isHidden = true;
        twentyFive.isHidden = true;
        fifty.isHidden = true;
        btnDeal.isHidden = true;
        btnStand.isHidden = false
        btnHit.isHidden = false
        let tempCard = Card(suit: "cardFront", value: 0)
        tempCard.position = CGPoint(x:630, y:980)
        addChild(tempCard)
        tempCard.zPosition = 100
        
        let newCard = deck.getTopCard()
        
        var whichPosition = playerCardY
        var whichHand = player.hand
        if(self.playerType is Player){
            whichHand = player.hand
            whichPosition = playerCardY;
        } else {
            whichHand = croupier.hand
            whichPosition = dealerCardY;
        }
        
        whichHand.addCard(card: newCard)
        let xPos = 50 + (whichHand.getHandLength()*35)
        let moveCard = SKAction.move(to: CGPoint(x:xPos, y: whichPosition),duration: 1.0)
        tempCard.run(moveCard, completion: { [unowned self] in
            self.player.setCanBet(canBet: true)
            if(self.playerType is Croupier && self.croupier.hand.getHandLength() == 1){
                self.croupier.setCard(card: newCard)
                self.cards.append(tempCard)
                tempCard.zPosition = 0
            } else {
                tempCard.removeFromParent()
                self.cards.append(newCard)
                self.addChild(newCard)
                newCard.position = CGPoint( x: xPos, y: whichPosition)
                newCard.zPosition = 100
            }
            if(self.croupier.hand.getHandLength() < 2){
                if(self.playerType is Player){
                    self.playerType = self.croupier
                }else{
                    self.playerType = self.player
                }
                self.dealBtnAxn()
            }else if (self.croupier.hand.getHandLength() == 2 && self.player.hand.getHandLength() == 2) {
                if(self.player.hand.getHandValue() == 21 || self.croupier.hand.getHandValue() == 21){
                    self.gameOver(hasBlackJack: true)
                } else {
                    self.btnStand.isHidden = false;
                    self.btnHit.isHidden = false;
                }
            }
            
            if(self.croupier.hand.getHandLength() >= 3 && self.croupier.hand.getHandValue() < 17){
                self.dealBtnAxn();
            } else if(self.player.isYeilding() && self.croupier.hand.getHandValue() >= 17){
                self.btnStand.isHidden = true
                self.btnHit.isHidden = true
                self.gameOver(hasBlackJack: false)
            }
            if(self.player.hand.getHandValue() > 21){
                self.btnStand.isHidden = true;
                self.btnHit.isHidden = true;
                self.gameOver(hasBlackJack: false);
            }
        })
        
    }
    
    //MARK: Game Logic
    func gameOver(hasBlackJack: Bool){
        btnHit.isHidden = true
        btnStand.isHidden = true
        let tempCardX = cards[1].position.x
        let tempCardY = cards[1].position.y
        let tempCard = croupier.getCard()
        addChild(tempCard)
        cards.append(tempCard)
        tempCard.position = CGPoint(x:tempCardX,y:tempCardY)
        tempCard.zPosition = 0
        
        var winner:BasePlayer = player
        
        if(hasBlackJack){
            if(player.hand.getHandValue() > croupier.hand.getHandValue()){
                //Add to players cash Here (pot value * 1.5)
                instruction.text = "You Got BlackJack!";
                moveMoneyContainer(position: playerCardY)
            }else{
                //Subtract from players cash here
                instruction.text = "Dealer got BlackJack!";
                moveMoneyContainer(position: dealerCardY)
            }
            return
        }
        if (player.hand.getHandValue() > 21){
            instruction.text = "You Busted!"
            //Subtract from players cash
            winner = croupier
        }else if (croupier.hand.getHandValue() > 21){
            //Add to players cash
            instruction.text = "Dealer Busts. You Win!"
            winner = player
        }else if (croupier.hand.getHandValue() > player.hand.getHandValue()){
            //Subtract from players cash
            instruction.text = "You Lose!"
            winner = croupier
        } else if (croupier.hand.getHandValue() == player.hand.getHandValue()){
            //Subtract from players cash
            instruction.text = "Tie - Dealer Wins!"
            winner = croupier
        }else if (croupier.hand.getHandValue() < player.hand.getHandValue()){
            //Add to players cash
            instruction.text="You Win!";
            winner = player
        }
        if(winner is Player){
            moveMoneyContainer(position: playerCardY)
        }else{
            moveMoneyContainer(position: dealerCardY)
        }
        
    }
    
    //MARK: Move money to container
    func moveMoneyContainer(position: Int){
        let moveMoneyContainer = SKAction.moveTo(y: CGFloat(position), duration: 3.0)
        container.run(moveMoneyContainer, completion: { [unowned self] in
            self.resetMoneyContainer()
        });
    }
    
    //MARK: Reset money container
    func resetMoneyContainer(){
        //Remove all card from coin container
        container.removeAllChildren()
        container.position.y = size.height/2
        resetNewGame()
    }
    
    //MARK: Reset and start new game
    func resetNewGame(){
        playerType = player
        deck.resetDeck()
        instruction.text = "PLAY GAME";
        ten.isHidden = false;
        twentyFive.isHidden = false;
        fifty.isHidden = false;
        btnDeal.isHidden = false
        player.hand.resetHand()
        croupier.hand.resetHand()
        player.setYielding(yields: false)
        moneyPot.reset()
        for card in cards{
            card.removeFromParent()
        }
        cards.removeAll()
    }
    
    //MARK: hit btn axn
    func hitBtnAxn(){
        if(player.getCanBet()){
            btnStand.isHidden = true
            btnHit.isHidden = true
            playerType = player
            dealBtnAxn()
            player.setCanBet(canBet: false)
        }
    }
    
    //MARK: stand btn axn
    func standBtnAxn(){
        btnStand.isHidden = true
        btnHit.isHidden = true
        player.setYielding(yields: true)
        if(croupier.hand.getHandValue() < 17){
            playerType = croupier
            dealBtnAxn();
        }else{
            gameOver(hasBlackJack: false)
        }
    }
}
