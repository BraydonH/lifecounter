//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by cse-loaner on 2/1/19.
//  Copyright © 2019 uw. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
  var events: [String] = []
  @IBOutlet var historyTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    historyTableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
    cell.textLabel?.text = events[indexPath.row]
    return cell
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

}
