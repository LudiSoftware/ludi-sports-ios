//
//  NoteCell.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/22/23.
//

import UIKit

class NoteCell: UITableViewCell {
    

    @IBOutlet weak var noteMessage: UILabel!
    @IBOutlet var noteMakerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with note: Note) {
        noteMessage.text = note.message
        noteMakerName.text = note.ownerName
        
    }

    
}
