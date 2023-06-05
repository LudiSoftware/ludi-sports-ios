//
//  chatMessage.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/23/23.
//

import UIKit

class chatMessage: UITableViewCell {

    @IBOutlet weak var chatText: UILabel!
    
    @IBOutlet weak var chatOwner: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with chatMessage: Chat){
        print("Made it")
        print(chatMessage.messageText)
        chatOwner.text = chatMessage.senderName
        chatText.text = chatMessage.messageText
        
    }
    
}
