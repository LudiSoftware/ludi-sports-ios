//
//  TeamNotesViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.
//

import Foundation
import UIKit
import FirebaseDatabase
import RealmSwift

class TeamNotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var notesTableView: UITableView!
    // Add your properties and outlets here
    var team: Team?
    var realmInstance = realm()
    var notesList: Results<Note>!
    var note: Note?
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "NoteCell", bundle: nil)
            notesTableView.register(nib, forCellReuseIdentifier: "noteCell")

        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        fireGetNotesAsync(realm: realmInstance)
        
        notesList = realmInstance.objects(Note.self)
               
               for note in notesList {
                   self.notes.append(note)
        }
        notesTableView.reloadData()
    }
    // MARK: - UITableViewDataSource
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return notes.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteCell else {
                  return UITableViewCell()
              }
          
           let note = notes[indexPath.row]
//           print(note.message)
//           print(note.ownerName)
          
           cell.configure(with: note)
           
           return cell
       }
       
       // MARK: - UITableViewDelegate
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // Handle row selection if needed
       }
   }
    
    // MARK: - UI Setup
    
    func setupUI() {
        // Setup your UI components, such as labels, buttons, table view, etc.
        // Add Auto Layout constraints, set colors, fonts, etc.
    }
    
    // MARK: - Data Loading
    
    func loadData() {
        
        // Load data from a data source or API
        // Update your UI components with the loaded data
    }
    
    // MARK: - Actions
    
    // Add your action methods here, such as button tap handlers, etc.
    
    // MARK: - Other Helper Methods
    
    // Add any other helper methods as needed


