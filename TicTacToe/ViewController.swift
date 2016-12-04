//
//  ViewController.swift
//  TicTacToe
//
//  Created by Danya  on 11/5/16.
//  Copyright © 2016 Danya Baron. All rights reserved.
//

import UIKit


import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    var winner = false
    
    var crossArray = [5]
    var noughtArray = [4]
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgainLabel: UILabel!
    
    
    
    @IBAction func action(_ sender: AnyObject)
    {
        
        
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                winner = false
                
                if gameState[combination[0]] == 1
                {
                    winner = true
                    label.text = "CROSS HAS WON!"
                }
                else
                {
                    winner = true
                    label.text = "NOUGHT HAS WON!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
                playAgainLabel.isHidden = false
            }
        }
        
        gameIsActive = false
        //winner = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                //winner = true
                break
            }
            
        }
        
        if gameIsActive == false
        {
            if winner == false {
                label.text = "IT WAS A TIE!"
                label.isHidden = false
                playAgainButton.isHidden = false
                playAgainLabel.isHidden = false
            }
            if winner == true {
                
            }
            
        }
        
    }

    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBAction func playAgain(_ sender: AnyObject)
    {
        winner = false
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        playAgainLabel.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
   
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.backgroundColor = UIColor(patternImage: UIImage(named: "Winning Label")!)
        playAgainLabel.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


