//
//  Card.swift
//  SW1
//
//  Created by 王康力 on 2019/10/23.
//  Copyright © 2019 王康力. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false;
    var isMached = false;
    var identifer : Int;
    
    static var identifierFactory = 0
    static func getUniqueIdentifier()->Int{
        Card.identifierFactory+=1
        return Card.identifierFactory
    }
    init() {
        
        self.identifer = Card.getUniqueIdentifier()
    }
}
