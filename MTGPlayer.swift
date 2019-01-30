//
//  MTGPlayer.swift
//  lifecounter
//
//  Created by cse-loaner on 1/29/19.
//  Copyright © 2019 uw. All rights reserved.
//

import UIKit

class MTGPlayer: UIView {

  @IBOutlet var contentView: UIView!
  @IBOutlet weak var plusOneButton: UIButton!
  @IBOutlet weak var plusFiveButton: UIButton!
  @IBOutlet weak var minusOneButton: UIButton!
  @IBOutlet weak var minusFiveButton: UIButton!
  @IBOutlet weak var healthLabel: UILabel!
  @IBOutlet weak var label: UILabel!
  var currentHealth: Int = 20
  
  var caption: String? {
    get { return label?.text }
    set { label.text = newValue }
  }
  
  var health: Int {
    get { return currentHealth }
    set { currentHealth = newValue }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }
  
  func initSubviews() {
    // standard initialization logic
    let nib = UINib(nibName: "MTGPlayer", bundle: nil)
    nib.instantiate(withOwner: self, options: nil)
    contentView.frame = bounds
    addSubview(contentView)
      
      // custom initialization logic
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    switch sender {
    case plusOneButton:
      currentHealth += 1
    case plusFiveButton:
      currentHealth += 5
    case minusOneButton:
      currentHealth -= 1
    case minusFiveButton:
      currentHealth -= 5
    default:
      break
    }
    healthLabel.text = String(currentHealth)
  }
  /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
