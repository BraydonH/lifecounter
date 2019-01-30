//
//  ViewController.swift
//  lifecounter
//
//  Created by cse-loaner on 1/29/19.
//  Copyright © 2019 uw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var player1: MTGPlayer!
  @IBOutlet weak var player2: MTGPlayer!
  @IBOutlet weak var player3: MTGPlayer!
  @IBOutlet weak var player4: MTGPlayer!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    player1.caption = "Player 1"
    player2.caption = "Player 2"
    player3.caption = "Player 3"
    player4.caption = "Player 4"
    
    // Do any additional setup after loading the view, typically from a nib.
  }


}

