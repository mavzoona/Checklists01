//
//  ItemsTableViewCell.swift
//  Checklists01
//
//  Created by ASDiMac1 on 22/04/22.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var CheckMark: UIImageView!
    @IBOutlet weak var ItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
