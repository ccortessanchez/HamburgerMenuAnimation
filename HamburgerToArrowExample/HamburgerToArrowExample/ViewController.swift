//
//  ViewController.swift
//  HamburgerToArrowExample
//
//  Created by Olivier LAPRAYE on 20/11/2017.
//  Copyright © 2017 Olivier LAPRAYE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hamburgerArrow: HamburgerToArrow!
    @IBOutlet weak var hamburgerQuit: HamburgerToQuit!
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button is tapped")
    }
    
    override func viewDidLoad() {
        hamburgerQuit.animationDuration = 1.0
        hamburgerQuit.strokesColor = UIColor.red
    }
}

