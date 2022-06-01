//
//  ViewControllerTableViewCell.swift
//  PredictionsFootball
//
//  Created by Разработчик on 06.05.2020.
//  Copyright © 2020 Разработчик. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelPosition: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
