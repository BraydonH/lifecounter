//
//  ViewController.swift
//  lifecounter
//
//  Created by cse-loaner on 1/29/19.
//  Copyright © 2019 uw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var p1Health = 20
  var p2Health = 20
  var p3Health = 20
  var p4Health = 20
  
  @IBOutlet weak var p1HealthLabel: UILabel!
  @IBOutlet weak var p2HealthLabel: UILabel!
  @IBOutlet weak var p3HealthLabel: UILabel!
  @IBOutlet weak var p4HealthLabel: UILabel!
  @IBOutlet weak var loserLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    p1HealthLabel.text = String(p1Health)
    p2HealthLabel.text = String(p2Health)
    p3HealthLabel.text = String(p3Health)
    p4HealthLabel.text = String(p4Health)
  }

  @IBAction func buttonPressed(_ sender: UIButton) {
    if let buttonText = sender.titleLabel?.text {
      switch buttonText {
      case "-5":
        adjustHealth(player: sender.tag, amount: -5)
      case "-":
        adjustHealth(player: sender.tag, amount: -1)
      case "+":
        adjustHealth(player: sender.tag, amount: 1)
      case "+5":
        adjustHealth(player: sender.tag, amount: 5)
      default:
        break
      }
    }
  }
  
  func adjustHealth(player: Int, amount: Int) {
    switch player {
    case 1:
      p1Health += amount
      if (p1Health <= 0) {
        p1Health = 0
        loserLabel.text = "Player 1 loses"
      }
      p1HealthLabel.text = String(p1Health)
    case 2:
      p2Health += amount
      if (p2Health <= 0) {
        p2Health = 0
        loserLabel.text = "Player 2 loses"
      }
      p2HealthLabel.text = String(p2Health)
    case 3:
      p3Health += amount
      if (p3Health <= 0) {
        p3Health = 0
        loserLabel.text = "Player 3 loses"
      }
      p3HealthLabel.text = String(p3Health)
    case 4:
      p4Health += amount
      if (p4Health <= 0) {
        p4Health = 0
        loserLabel.text = "Player 4 loses"
      }
      p4HealthLabel.text = String(p4Health)
    default:
      break
    }
  }
  
}

