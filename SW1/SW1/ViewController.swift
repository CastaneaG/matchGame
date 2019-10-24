//
//  ViewController.swift
//  SW1
//
//  Created by 王康力 on 2019/10/23.
//  Copyright © 2019 王康力. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //属性构造器需要在self可用之前运行
    //变量在被使用之前要求被完全初始化 cardButtons.count 也就是直到它被完全初始化，任何人不可以使用game实例
    //使用懒加载 不能使用didset
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2);
    
    var flipCount  = 0{
        //在变量改变时进行变更
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    @IBAction func regame(_ sender: UIButton) {
        flipCount = 0
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        updateViewFromModel()
        
    }
    
    //数组 swift特殊语法
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices:Array<String> = ["👻","🎃","🍎","☁️","🐷","🤮","🦕"];
    //var emoji = Dictionary<Int,String>()
    var emoji = [Int:String]()
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //let cardNumber = cardButtons.firstIndex(of: sender)!
        //print("cardNumber = \(cardNumber)")
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            print("cardNumber = \(cardNumber)")
            updateViewFromModel()
        }else{
            print("[Bug] chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel(){
        for index in 0..<cardButtons.count {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMached ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) :#colorLiteral(red: 1, green: 0.6258553863, blue: 0.007790974341, alpha: 1)
            }
        }
    }
    
    
    func flipCard(withEmoji emoji:String ,on button:UIButton ){
        //\()字符串插值
        print("emoji is \(emoji)and\(button.currentTitle)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6258553863, blue: 0.007790974341, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
    func emoji(for card:Card) -> String {
        if emoji[card.identifer] == nil {
                if emojiChoices.count > 0{
                //创建随机索引
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                // remove at 会返回删除元素，删除防止获取到相同图案
                emoji[card.identifer] = emojiChoices.remove(at: randomIndex)
            }
        }
//        if emoji[card.identifer] != nil{
//            return emoji[card.identifer]!
//        }else{
//        return "?"
//        }
        //x上下代码等价
        //如果 emoji[card.identifer] 是nil 则返回 ?? 后面的"?"
        return emoji[card.identifer] ?? "?"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

