//
//  FormationViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/23/23.
//

import UIKit
import MobileCoreServices

class FormationViewController: UIViewController {
    
    @IBOutlet weak var formationTableView: FormationTableView!
    @IBOutlet weak var soccerImage: UIImageView!
    
    var roster: [PlayerRef] = []
    var dropInteraction: UIDropInteraction!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        soccerImage.image = UIImage(named: "Soccer_Field_Transparant.svg")
        
        // Set up drop interaction for the soccer image view
        dropInteraction = UIDropInteraction(delegate: self)
        soccerImage.addInteraction(dropInteraction)
    }
    
}

extension FormationViewController: UIDropInteractionDelegate {
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.hasItemsConforming(toTypeIdentifiers: [kUTTypePlainText as String])
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSString.self) { [weak self] items in
            guard let strings = items as? [String], let self = self else {
                return
            }
            
            // Handle the dropped items (strings) here
            // You can access the dropped items from the "strings" array
            
            // Example: Log the dropped strings
            print(strings)
        }
    }
}
