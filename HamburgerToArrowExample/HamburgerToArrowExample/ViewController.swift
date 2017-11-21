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
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button is tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hamburgerArrow.animationDuration = 0.5
    }
}

