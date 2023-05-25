//
//  ChatForCoachesViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.
//

import Foundation
import UIKit
import RealmSwift
import FirebaseDatabase

class ChatForCoachesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var chatTableView: UITableView!
    // Add your properties and outlets here
    var team: Team?
    var realmInstance = realm()
    var chatLog: Results<Chat>!
    var chat: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        fireGetChatAsync(realm: realmInstance)
        
        chatLog = realmInstance.objects(Chat.self)
        
        
        if chatLog.isEmpty {
            print("ChatLog is empty.")
        } else {
            for message in chatLog {
                self.chat.append(message)
                print(chat)
                
        }
            chatTableView.reloadData()
        
        }
        
        
        
        // Perform any additional setup after loading the view.
        setupUI()
        loadChatHistory()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chatMessage", for: indexPath) as? chatMessage else {
               return UITableViewCell()
           }
       
        let chat = chat[indexPath.row]
//           print(note.message)
//           print(note.ownerName)
       
        cell.configure(with: chat)
        
        return cell
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        // Setup your UI components, such as chat bubbles, input text field, send button, etc.
        // Add Auto Layout constraints, set colors, fonts, etc.
    }
    
    // MARK: - Chat History Loading
    
    private func loadChatHistory() {
        // Load chat history from a data source or API
        // Update your chat UI with the loaded chat history
    }
    
    // MARK: - Send Message
    
    private func sendMessage(_ message: String) {
        // Send the message to the recipient (e.g., server, database, etc.)
        // Update the chat UI with the sent message
    }
    
    // MARK: - Actions
    
    // Add your action methods here, such as send button tap handler, etc.
    
    // MARK: - Other Helper Methods
    
    // Add any other helper methods as needed
}
