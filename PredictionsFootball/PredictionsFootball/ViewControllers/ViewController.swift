//
//  ViewController.swift
//  Demo predictions
//
//  Created by Витя on 3/24/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    func setUpElements(){
          Utilities.styleFilledButton(signUpButton)
          Utilities.styleHollowButton(loginButton)
      }

}

