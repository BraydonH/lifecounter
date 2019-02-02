//
//  PlayerTableViewCell.swift
//  lifecounter
//
//  Created by cse-loaner on 1/31/19.
//  Copyright © 2019 uw. All rights reserved.
//

import UIKit

class playerTableViewCell: UITableViewCell {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var healthLabel: UILabel!
  @IBOutlet weak var minusMultipleButton: UIButton!
  @IBOutlet weak var minusOneButton: UIButton!
  @IBOutlet weak var plusOneButton: UIButton!
  @IBOutlet weak var plusMultipleButton: UIButton!
  
  weak var controller: ViewController?
  
  var currentHealth: Int = 20
  var increment: Int = 5
  
  var viewController: ViewController? {
    get { return controller}
    set { controller = newValue }
  }
  
  var playerName: String? {
    get { return label?.text }
    set { label.text = newValue }
  }
  
  var health: Int {
    get { return currentHealth }
    set {
      currentHealth = newValue
      healthLabel.text = String(currentHealth)
    }
  }
  
  var buttonIncrement: Int {
    get { return increment }
    set {
      increment = newValue
      minusMultipleButton.setTitle("-\(newValue)", for: .normal)
      plusMultipleButton.setTitle("+ \(newValue)", for: .normal)
    }
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    switch sender {
    case plusOneButton:
      currentHealth += 1
    case plusMultipleButton:
      currentHealth += increment
    case minusOneButton:
      currentHealth -= 1
    case minusMultipleButton:
      currentHealth -= increment
    default:
      break
    }
    currentHealth = max(currentHealth, 0)
    controller?.startGame()
    healthLabel.text = String(currentHealth)
    controller?.updateHealth(name: label.text!, health: currentHealth)
  }

}

