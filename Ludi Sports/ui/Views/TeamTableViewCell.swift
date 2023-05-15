//
//  TeamTableViewCell.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/10/23.
//

import Foundation
import UIKit

class  TeamTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var teamLabel: UILabel!
  
    
    func configure(with teams: String) {
       
        teamLabel.text = teams
        }
    
}
