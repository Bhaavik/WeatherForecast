//
//  WheatherCell.swift
//  WeatherForecast
//
//  Created by Bhavik Doshi on 11/10/18.
//  Copyright © 2018 Bhavik Doshi. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
 
}
