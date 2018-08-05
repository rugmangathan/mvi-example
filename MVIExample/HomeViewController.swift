//
//  HomeViewController.swift
//  MVIExample
//
//  Created by Rugmangathan on 04/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func budapestTap(_ sender: UIButton) {
    let budapestView = storyboard?.instantiateViewController(withIdentifier: "BudapestViewController")
    navigationController?.pushViewController(budapestView!, animated: true)
  }

  @IBAction func counterTap(_ sender: UIButton) {
    let counterView = storyboard?.instantiateViewController(withIdentifier: "CounterViewController")
    navigationController?.pushViewController(counterView!, animated: true)
  }
}
