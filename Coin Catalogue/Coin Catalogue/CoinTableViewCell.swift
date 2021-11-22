//
//  CoinTableViewCell.swift
//  Coin Catalogue
//
//  Created by Jay on 16/08/20.
//  Copyright © 2020 Jay Kaushal. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    @IBOutlet weak var frontImg: UIImageView!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var currencyLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
