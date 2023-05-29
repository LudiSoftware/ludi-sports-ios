//
//  FormationCell.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/25/23.
//

import UIKit

class FormationCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with player: PlayerRef) {
        playerName.text = player.name
        //playerImage.image = player.imgUrl
        
    
    }
}
