//
//  FormationViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/23/23.
//

import UIKit
import MobileCoreServices
import RealmSwift

class FormationViewController: UIViewController {
    
    @IBOutlet weak var formationTableView: FormationTableView!
    @IBOutlet weak var soccerImage: UIImageView!
    
    @IBOutlet weak var testPlayer: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    var rosterId: String?
    var realmInstance = realm()
    var panGesture: UIPanGestureRecognizer!

        override func viewDidLoad() {
            super.viewDidLoad()

            testLabel.text = rosterId

            print(rosterId)
            var playerList = realmInstance.findPlayersInRosterById(rosterId: rosterId)
            var player = playerList?.first

            // Set up the FormationTableView
            // formationTableView.setRosterId(rosterId!)
            // formationTableView.rosterId = team?.rosterId
            // formationTableView.reloadData()

            soccerImage.image = UIImage(named: "Soccer_Field_Transparant.svg")

            // Set up drop interaction for the soccer image view
            let dropInteraction = UIDropInteraction(delegate: self)
            soccerImage.addInteraction(dropInteraction)

            // Set up pan gesture recognizer for the testPlayer image
            panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
            testPlayer.isUserInteractionEnabled = true
            testPlayer.addGestureRecognizer(panGesture)
        }

        @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
            let translation = recognizer.translation(in: view)
            if let view = recognizer.view {
                view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            }
            recognizer.setTranslation(CGPoint.zero, in: view)
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
