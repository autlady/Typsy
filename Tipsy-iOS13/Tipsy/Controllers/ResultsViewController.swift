//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by  Юлия Григорьева on 17.04.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var perPerson = "0"
    var people = 0
    var tip = "0"

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(perPerson)"
        settingsLabel.text = "Split between \(people) people, with \(tip) tip"
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
