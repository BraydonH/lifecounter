//
//  ViewController.swift
//  lifecounter
//
//  Created by cse-loaner on 1/29/19.
//  Copyright © 2019 uw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  

  @IBOutlet weak var playerTableView: UITableView!
  @IBOutlet weak var loserLabel: UILabel!
  @IBOutlet weak var addPlayerButton: UIButton!
  @IBOutlet weak var setIncrementButton: UIButton!
  @IBOutlet weak var incrementField: UITextField!
  @IBOutlet weak var navBar: UINavigationItem!
  @IBOutlet weak var historyButton: UIBarButtonItem!
  
  var increment = 5
  var numPlayers = 0
  var numAlive = 0
  var gameStarted = false
  var players: [String:Int] = [:]
  var events: [String] = []
//  var firstPress : Bool  = false// because of a first press error that confuses the hell out of me
  
  func startGame() {
    gameStarted = true
    addPlayerButton.isEnabled = false
    loserLabel.text = ""
  }
  
  func reset() {
    for view in playerTableView.subviews{
      view.removeFromSuperview()
    }
    gameStarted = false
    numPlayers = 0
    numAlive = 0
    addPlayerButton.isEnabled = true
    players = [:]
    events = []
    addPlayer(self)
    addPlayer(self)
  }
  
  @IBAction func resetButtonPressed(_ sender: Any) {
    reset()
  }
  
  func updateHealth(name: String, health: Int) {
    var h = health
    let oldHealth = players[name]!
    if oldHealth == 0 {
      return
    }
    if oldHealth > 0 {
      let healthLost = oldHealth - h
      if healthLost < 0 {
        events.append("\(name) gained \(healthLost) health.")
      } else {
        events.append("\(name) lost \(healthLost) health.")
      }
    }
    if h <= 0 && players[name]! > 0 {
      h = 0
      numAlive -= 1
      loserLabel.text = "\(name) loses!"
      events.append("\(name) loses!")
    }
    players[name] = h
    
    if numAlive == 1 {
      var winner: String = ""
      for (player, playerHealth) in players  {
        if playerHealth > 0 {
          winner = player
          break
        }
      }
      loserLabel.text = "\(winner) wins!"
      events.append("\(winner) wins!")
    }
  }
  
  @IBAction func setIncrement(_ sender: Any) {
    if let num = Int(incrementField.text!) {
      increment = num
      for cell in playerTableView.visibleCells as! [playerTableViewCell] {
        //do someting with the cell here.
        cell.buttonIncrement = increment
      }
    }
  }
  
  // doesn't work the first time for some random reason
  @IBAction func addPlayer(_ sender: Any) {
    if (numPlayers < 8 && !gameStarted) {
      playerTableView.addSubview(playerTableViewCell())
      numPlayers += 1
      numAlive += 1
      playerTableView.reloadData()
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.playerTableView.delegate = self
    self.playerTableView.dataSource = self
    addPlayer(self)
    addPlayer(self)
//    firstPress = true
    incrementField.addDoneButtonOnKeyboard()
    historyButton.isEnabled = true
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numPlayers
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
      as! playerTableViewCell
    
    cell.playerName = "Player \(indexPath.row + 1)"
    players[cell.playerName!] = 20
    cell.health = 20
    cell.buttonIncrement = increment
    cell.viewController = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // cell selected code here
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if segue.destination is UINavigationController
    {
      let navVC = segue.destination as? UINavigationController
      if navVC?.viewControllers.first is HistoryTableViewController {
        let vc = navVC!.viewControllers.first as? HistoryTableViewController
        vc?.events = events
      }
    }
  }
}

