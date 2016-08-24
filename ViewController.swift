//
//  ViewController.swift
//  TicTacToe
//
//  Created by Felicia Weathers on 8/17/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var gameActive = true
    
    var activePlayer = 1 // 1 = noughts, 2 = crosses
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.isHidden = true
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
        
        playAgain.isHidden = true
        playAgain.center = CGPoint(x: playAgain.center.x - 500, y: playAgain.center.y)
        
        var buttonToClear: UIButton
        
        for i in 0 ..< 9 {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, for: .normal)
            
        }
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), for: .normal)
                
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), for: .normal)
                
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if (gameState[combination[0]] == 1) {
                        
                        gameOverLabel.text = "Noughts is the winner"
                        
                    } else {
                        
                        gameOverLabel.text = "Crosses is the winner"
                        
                    }
                    
                    endGame()
                    
                }
            }
            
            if gameActive == true {
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                    }
                }
                
                if gameActive == false {
                    
                    gameOverLabel.text = "It's a draw!"
                    
                    endGame()
                }
            }
        }
    }
    
    func endGame() {
        
        gameOverLabel.isHidden = false
        playAgain.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.gameOverLabel.center = CGPoint(x: self.gameOverLabel.center.x + 500, y: self.gameOverLabel.center.y)
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.isHidden = true
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
        
        playAgain.isHidden = true
        playAgain.center = CGPoint(x: playAgain.center.x - 500, y: playAgain.center.y)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

