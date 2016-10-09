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
    
    @IBAction func again(_ sender: AnyObject) {
        
        activeGame = true
        gameState = [0,0,0,0,0,0,0,0,0]
        
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
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //1 is O, 2 is X
    var activePlayer = 0
    
    var activeGame = true
    
    var gameState = [0,0,0,0,0,0,0,0,0] //0 = empty, 1 = Circle, 2 = X
    
    let winningCombo = [[0,1,2], [3,4,5], [6,7,8], [1,4,7], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet weak var labelWhoFirst: UILabel!
    
    @IBAction func whoGoesThere(_ sender: AnyObject) {
        let firstMove = Int(arc4random_uniform(2))
        
        if (firstMove == 0){
            labelWhoFirst.text = "X goes first"
            activePlayer = 2
        }else {
            labelWhoFirst.text = "O goes first"
            activePlayer = 1
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            }else if (activePlayer == 2) {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }else if (activePlayer == 0) {
                alert(message: "Please click the button at the top to see who goes first!", title: "Oops")
            }
            for combo in winningCombo {
                if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[2] {
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgain.isHidden = false
                    if gameState[combo[0]] == 1 {
                        winnerLabel.text = "O has won!"
                    } else {
                        winnerLabel.text = "X has won!"
                    }
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

