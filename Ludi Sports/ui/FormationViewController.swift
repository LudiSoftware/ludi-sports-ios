//
//  FormationViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/23/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase


import UIKit

class FormationViewController: UIViewController, UITableViewDragDelegate {
    
    @IBOutlet weak var soccerImage: UIImageView!
    @IBOutlet weak var formationTableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
       
            // Set the background image of the soccerImage UIImageView
            soccerImage.image = UIImage(named: "Soccer_Field_Transparant")
            
            // Set the drag delegate for the table view
            formationTableView.dragDelegate = self
            // Enable drag interactions for the table view
            formationTableView.dragInteractionEnabled = true
        }
        
        // MARK: - UITableViewDragDelegate
        
        func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
            // Create UIDragItems for the items you want to drag
            let placeholderItem = UIImage(systemName: "square.fill") // Use an appropriate placeholder image or data
              
            // Create a UIDragItem with the placeholder item
            let itemProvider = NSItemProvider(object: placeholderItem as! NSItemProviderWriting)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            
            return [dragItem]
        }
        
    }
