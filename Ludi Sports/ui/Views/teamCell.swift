//
//  TeamCell.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/16/23.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamHeadCoach: UILabel!
    @IBOutlet weak var teamAgeGroup: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
