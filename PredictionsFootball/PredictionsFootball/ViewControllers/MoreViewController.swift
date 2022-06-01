//
//  MoreViewController.swift
//  PredictionsFootball
//
//  Created by Разработчик on 16.07.2020.
//  Copyright © 2020 Разработчик. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var buttonProfile: UIButton!
    @IBOutlet weak var buttonRating: UIButton!
    @IBOutlet weak var buttonRules: UIButton!
    @IBOutlet weak var buttonPrizes: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(buttonProfile)
        Utilities.styleFilledButton(buttonRating)
        Utilities.styleFilledButton(buttonRules)
        Utilities.styleFilledButton(buttonPrizes)
            
}
    

}
