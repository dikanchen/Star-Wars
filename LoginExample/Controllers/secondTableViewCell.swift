//
//  secondTableViewCell.swift
//  LoginExample
//
//  Created by User on 2/12/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit

class secondTableViewCell: UITableViewCell {

    @IBOutlet weak var shipsimg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var passenger: UILabel!
    @IBOutlet weak var cargo: UILabel!
    @IBOutlet weak var consumable: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var mglt: UILabel!
    @IBOutlet weak var shipclass: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
