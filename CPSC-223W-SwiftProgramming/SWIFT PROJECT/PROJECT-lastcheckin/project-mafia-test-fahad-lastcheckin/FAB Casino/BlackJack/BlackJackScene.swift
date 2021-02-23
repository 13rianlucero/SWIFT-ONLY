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
    let croupier = Croupier(hand: Hand())
    var playerType:BasePlayer = Player(hand: Hand(),cash: Cash())
    var balance = SKLabelNode(text: "Balance")
    let vm  = BlackJackViewModel()
    override func didMove(to view: SKView) {
        setupBoard()
        setupCoins()
        setupButtons()
        playerType = vm.player
        vm.updateDealerCardY(pos: Int(8*size.height/10))
        vm.updatePlayerCardY(pos: Int(2*size.height/10))
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
        balance = SKLabelNode(text: "Balance: \(vm.getPlayerBalance())")
        balance.fontSize = 17
        balance.fontColor = UIColor.black
        addChild(balance)
        balance.position = CGPoint(x: 50, y: size.height - 50)
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
        if(betAmount.rawValue > vm.getPlayerBalance()){
            let alert = UIAlertController(title: "Out Of Money", message: "You are out of money", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
            return
        }else{
            vm.updateMoneyPot(amount: betAmount.rawValue)
            vm.updatePlayerBalance(amount: -betAmount.rawValue)
            balance.text = "Balance: \(vm.getPlayerBalance())"
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
        
        var whichPosition = vm.getPlayerCardY()
        var whichHand = vm.getPlayerHand()
        if(self.playerType is Player){
            whichHand = vm.getPlayerHand()
            whichPosition = vm.getPlayerCardY();
        } else {
            whichHand = croupier.hand
            whichPosition = vm.getDealerCardY();
        }
        
        whichHand.addCard(card: newCard)
        let xPos = 50 + (whichHand.getHandLength()*35)
        let moveCard = SKAction.move(to: CGPoint(x:xPos, y: whichPosition),duration: 1.0)
        tempCard.run(moveCard, completion: { [unowned self] in
            self.vm.player.setCanBet(canBet: true)
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
                    self.playerType = self.vm.player
                }
                self.dealBtnAxn()
            }else if (self.croupier.hand.getHandLength() == 2 && self.vm.getPlayerHand().getHandLength() == 2) {
                if(self.vm.getPlayerHand().getHandValue() == 21 || self.croupier.hand.getHandValue() == 21){
                    self.gameOver(hasBlackJack: true)
                } else {
                    self.btnStand.isHidden = false;
                    self.btnHit.isHidden = false;
                }
            }
            
            if(self.croupier.hand.getHandLength() >= 3 && self.croupier.hand.getHandValue() < 17){
                self.dealBtnAxn();
            } else if(self.vm.player.isYeilding() && self.croupier.hand.getHandValue() >= 17){
                self.btnStand.isHidden = true
                self.btnHit.isHidden = true
                self.gameOver(hasBlackJack: false)
            }
            if(self.vm.getPlayerHand().getHandValue() > 21){
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
        
        var winner:BasePlayer = vm.player
        
        if(hasBlackJack){
            if(vm.player.hand.getHandValue() > croupier.hand.getHandValue()){
                //Add to players cash Here (pot value * 1.5)
                instruction.text = "You Got BlackJack!";
                moveMoneyContainer(position: vm.getPlayerCardY())
            }else{
                //Subtract from players cash here
                instruction.text = "Dealer got BlackJack!";
                moveMoneyContainer(position: vm.getDealerCardY())
            }
            return
        }
        if (vm.getPlayerHand().getHandValue() > 21){
            instruction.text = "You Busted!"
            //Subtract from players cash
            winner = croupier
        }else if (croupier.hand.getHandValue() > 21){
            //Add to players cash
            instruction.text = "Dealer Busts. You Win!"
            winner = vm.player
        }else if (croupier.hand.getHandValue() > vm.getPlayerHand().getHandValue()){
            //Subtract from players cash
            instruction.text = "You Lose!"
            winner = croupier
        } else if (croupier.hand.getHandValue() == vm.getPlayerHand().getHandValue()){
            //Subtract from players cash
            instruction.text = "Tie - Dealer Wins!"
            winner = croupier
        }else if (croupier.hand.getHandValue() < vm.getPlayerHand().getHandValue()){
            //Add to players cash
            instruction.text="You Win!";
            winner = vm.player
        }
        if(winner is Player){
            moveMoneyContainer(position: vm.getPlayerCardY())
            vm.updatePlayerBalance(amount: 2 * vm.getMoneyFromPot())
            balance.text = "Balance: \(vm.getPlayerBalance())"
        }else{
            moveMoneyContainer(position: vm.getDealerCardY())
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
        playerType = vm.player
        deck.resetDeck()
        instruction.text = "PLAY GAME";
        ten.isHidden = false;
        twentyFive.isHidden = false;
        fifty.isHidden = false;
        btnDeal.isHidden = false
        vm.getPlayerHand().resetHand()
        croupier.hand.resetHand()
        vm.player.setYielding(yields: false)
        vm.resetMoneyPot()
        for card in cards{
            card.removeFromParent()
        }
        cards.removeAll()
    }
    
    //MARK: hit btn axn
    func hitBtnAxn(){
        if(vm.player.getCanBet()){
            btnStand.isHidden = true
            btnHit.isHidden = true
            playerType = vm.player
            dealBtnAxn()
            vm.player.setCanBet(canBet: false)
        }
    }
    
    //MARK: stand btn axn
    func standBtnAxn(){
        btnStand.isHidden = true
        btnHit.isHidden = true
        vm.player.setYielding(yields: true)
        if(croupier.hand.getHandValue() < 17){
            playerType = croupier
            dealBtnAxn();
        }else{
            gameOver(hasBlackJack: false)
        }
    }
}
