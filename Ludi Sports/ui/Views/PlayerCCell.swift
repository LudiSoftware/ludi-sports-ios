//
//  PlayerCCell.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/18/23.
//

import UIKit

class PlayerCCell: UICollectionViewCell {
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerPositionNumber: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configure(with player: PlayerRef) {
        playerName.text = player.name
        playerPosition.text = player.position
        
        
        
        
    }
    
}
