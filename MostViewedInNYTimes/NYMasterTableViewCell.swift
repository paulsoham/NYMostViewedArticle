//
//  NYMasterTableViewCell.swift
//  MostViewedInNYTimes
//
//  Created by apple on 08/03/18.
//  Copyright © 2018 Soham Paul. All rights reserved.
//

import UIKit

class NYMasterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
