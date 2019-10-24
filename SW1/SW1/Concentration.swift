//
//  Concentration.swift
//  SW1
//
//  Created by 王康力 on 2019/10/23.
//  Copyright © 2019 王康力. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard(at index:Int ){
        if !cards[index].isMached {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifer == cards[index].identifer  {
                    cards[matchIndex].isMached = true
                    cards[index].isMached = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
        
        
        
        
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        }else{
//            cards[index].isFaceUp = true
//        }
    }
    init(numberOfPairsOfCards: Int) {
        //0到number（包含） 0...numberOfPairsOfCards
        
            cards = [Card]()
            Card.identifierFactory = 0
        
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            //let matchingCard = Card(identifer: identifer)
            //结构体只传值
            //let matchingCard = card;
            //同上
            /*y
            cards.append(card)
            cards.append(card)
             用下面的骚操作
            */
            cards += [card,card];
        }
        //TODO: Shuffle the cards
    }
    

    
}
