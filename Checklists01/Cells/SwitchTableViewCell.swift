//
//  SwitchTableViewCell.swift
//  Checklists01
//
//  Created by ASDiMac1 on 25/04/22.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var SwitchCell: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
