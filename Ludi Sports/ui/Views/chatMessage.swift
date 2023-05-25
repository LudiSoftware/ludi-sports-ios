//
//  chatMessage.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/23/23.
//

import UIKit

class chatMessage: UITableViewCell {

    @IBOutlet weak var chatMessage: UILabel!
    @IBOutlet weak var chatOwnerImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with chat: Chat){
        print("Made it")
        print(chat.messageText)
    }
    
}
