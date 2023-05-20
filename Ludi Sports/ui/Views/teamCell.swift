//
//  TeamCell.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/16/23.
//
//text gets cutoff for some reason
import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamHeadCoach: UILabel!
    @IBOutlet weak var teamAgeGroup: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        contentView.autoresizingMask = [.flexibleHeight]
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       
        
    }
    func configure(with team: Team) {
        print(team)
       
        teamHeadCoach.text = team.headCoachName
        teamName.text = team.name
        teamAgeGroup.text = team.ageGroup
        
        // Add borders to the cell
                let borderColor = UIColor.gray.cgColor
                let borderWidth: CGFloat = 1.0

                // Top border
                let topBorder = CALayer()
                topBorder.backgroundColor = borderColor
                topBorder.frame = CGRect(x: 0, y: 0, width: frame.width, height: borderWidth)
                layer.addSublayer(topBorder)

                // Bottom border
                let bottomBorder = CALayer()
                bottomBorder.backgroundColor = borderColor
                bottomBorder.frame = CGRect(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth)
                layer.addSublayer(bottomBorder)

                // Left border
                let leftBorder = CALayer()
                leftBorder.backgroundColor = borderColor
                leftBorder.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.height)
                layer.addSublayer(leftBorder)

                // Right border
                let rightBorder = CALayer()
                rightBorder.backgroundColor = borderColor
                rightBorder.frame = CGRect(x: frame.width - borderWidth, y: 0, width: borderWidth, height: frame.height)
                layer.addSublayer(rightBorder)
        }
    
}

