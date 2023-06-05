//
//  FormationTableView.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/25/23.
//
import Foundation
import UIKit
import RealmSwift

class FormationTableView: UITableView, UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate {
    
    var realmInstance = realm()
    var team: Team?
    var rosterId: String?
    var roster: [PlayerRef] = []
    var test: List<PlayerRef>?
    
    
    //need list of playerRef objects in TableView and then need to be able to drag them and turn them into imageViews?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let rosterId = rosterId {
            test = realmInstance.findPlayersInRosterById(rosterId: rosterId)
            roster = Array(test!)
        }
        
        dataSource = self
        delegate = self
        register(UINib(nibName: "FormationCell", bundle: nil), forCellReuseIdentifier: "formationCell")
        dragInteractionEnabled = true
    }
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roster.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "formationCell"
        tableView.register(UINib(nibName: "FormationCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FormationCell
        
        // Configure the custom cell with your data
        let player = roster[indexPath.row]
        cell.configure(with: player)
        
        return cell
    }
    
    // MARK: - UITableViewDragDelegate
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = roster[indexPath.row]
        
        // Create a drag item with the cell's index path as the local context
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = indexPath
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        // Customize the appearance of the drag preview if needed
        let previewParameters = UIDragPreviewParameters()
        return previewParameters
    }
    
    func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
        // Perform any necessary actions when the drag session begins
    }
    
    func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        // Perform any necessary actions when the drag session ends
    }
    
    // MARK: - Other Helper Methods
    
    func updateRoster(_ newRoster: [PlayerRef]) {
        roster = newRoster
        reloadData()
    }
}
