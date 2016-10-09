//
//  ViewController.swift
//  ThreeXorO
//
//  Created by Timothy Myers on 10/8/16.
//  Copyright © 2016 Denver Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var xFirstButton: UIButton!
    @IBOutlet weak var oFirstButton: UIButton!
    
    //1 is O, 2 is X
    var activePlayer = 1
    
    var activeGame = true
    
    var moveCounter = 0
    
    var gameState = [0,0,0,0,0,0,0,0,0] //0 = empty, 1 = Circle, 2 = X
    
    let winningCombo = [[0,1,2], [3,4,5], [6,7,8], [1,4,7], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBAction func xGoesFirst(_ sender: AnyObject) {
        xFirstButton.backgroundColor = UIColor.green
        xFirstButton.isEnabled = false
        oFirstButton.isEnabled = false
        activePlayer = 2
    }
    
    @IBAction func oGoesFirst(_ sender: AnyObject) {
        oFirstButton.backgroundColor = UIColor.green
        xFirstButton.isEnabled = false
        oFirstButton.isEnabled = false
        activePlayer = 1
    }

    @IBAction func again(_ sender: AnyObject) {
        activePlayer = 0
        activeGame = true
        gameState = [0,0,0,0,0,0,0,0,0]
        moveCounter = 0
        xFirstButton.backgroundColor = UIColor.lightGray
        oFirstButton.backgroundColor = UIColor.lightGray
        xFirstButton.isEnabled = true
        oFirstButton.isEnabled = true
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        winnerLabel.isHidden = true
        playAgain.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgain.center = CGPoint(x: playAgain.center.x - 500, y: playAgain.center.y)
        
    }

    @IBAction func buttonPressed(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0 && activeGame {
            moveCounter += 1
            gameState[activePosition] = activePlayer
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            }else if (activePlayer == 2) {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combo in winningCombo {
                if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                    
            
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgain.isHidden = false
                    
                    if gameState[combo[0]] == 1 {
                        winnerLabel.text = "O has won!"
                    } else{
                        winnerLabel.text = "X has won!"
                    }
                    
                   
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgain.center = CGPoint(x: self.playAgain.center.x + 500, y: self.playAgain.center.y)
                    })
                }
                if moveCounter == 9 && activeGame {
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgain.isHidden = false
                    winnerLabel.text = "Draw :("
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgain.center = CGPoint(x: self.playAgain.center.x + 500, y: self.playAgain.center.y)
                    })
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        playAgain.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgain.center = CGPoint(x: playAgain.center.x - 500, y: playAgain.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

