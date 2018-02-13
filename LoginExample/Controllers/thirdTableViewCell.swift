//
//  thirdTableViewCell.swift
//  LoginExample
//
//  Created by User on 2/12/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit

class thirdTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rotation: UILabel!
    @IBOutlet weak var orbital: UILabel!
    @IBOutlet weak var diameter: UILabel!
    @IBOutlet weak var climate: UILabel!
    @IBOutlet weak var gravity: UILabel!
    @IBOutlet weak var terrain: UILabel!
    @IBOutlet weak var water: UILabel!
    @IBOutlet weak var population: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
