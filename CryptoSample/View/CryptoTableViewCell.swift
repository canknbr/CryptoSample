//
//  CryptoTableViewCell.swift
//  CryptoSample
//
//  Created by Can Kanbur on 6.04.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    @IBOutlet weak var priceText: UILabel!
    
    @IBOutlet weak var currencyText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
