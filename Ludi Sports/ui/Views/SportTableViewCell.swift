//
//  SportTableViewCell.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/10/23.
//

import Foundation
import UIKit


class  SportTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sportLabel: UILabel!
    
    func configure(with sports: Sport) {
       
        sportLabel.text = sports.name
        }
    
}
