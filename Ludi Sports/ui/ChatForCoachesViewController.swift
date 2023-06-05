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
import FirebaseAuth
import Firebase

class ChatForCoachesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var chatbar: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    // Add your properties and outlets here
    var team: Team?
    var realmInstance = realm()
    var chatLog: Results<Chat>!
    var chat: [Chat] = []
    var chatIdList: [String] = []
    var teamId: String?
    var currentUser: User? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        realmInstance.safeUser { it in
            currentUser = it
            print(currentUser?.name)
            print(currentUser)
           
        }
        
        chatTableView.register(UINib(nibName: "chatMessage", bundle: nil), forCellReuseIdentifier: "chatMessage")
        
        teamId = team?.id
        
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        if let it = teamId {
            fireGetChatAsync(teamId: it) { chats in
                chats
            }
        }
        
        chatLog = realmInstance.objects(Chat.self).sorted(byKeyPath: "timestamp")
        chat = Array(chatLog)
        print(chat)
        
       
            self.chatTableView.reloadData()
            
            let lastRowIndex = IndexPath(row: self.chat.count - 1, section: 0)
                self.chatTableView.scrollToRow(at: lastRowIndex, at: .bottom, animated: true)
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(chat.count)
        return chat.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chatMessage", for: indexPath) as? chatMessage else {
            return UITableViewCell()
        }
        
        let chatMessage = chat[indexPath.row]
        print(chatMessage.messageText)
        
        cell.configure(with: chatMessage)
        
        return cell
    }
    @IBAction func sendPressed(_ sender: Any) {
        guard let messageText = chatbar.text, !messageText.isEmpty else {
            return
        }
        
        if let teamId = teamId {
            let chatRef = Database.database().reference().child("chat").child(teamId)
            
            let messageData: [String: Any] = [
                "messageText": messageText,
                "timestamp": ServerValue.timestamp(),
                "senderName": currentUser?.name
                // Add any additional properties you have in the Chat object
            ]
            
            let newMessageRef = chatRef.childByAutoId()
            newMessageRef.setValue(messageData) { [weak self] error, _ in
                if let error = error {
                    print("Failed to send message to Firebase: \(error)")
                    return
                }
                
                // Update local chat list and reload table view
                let chatMessage = Chat()
                chatMessage.messageText = messageText
                chatMessage.timestamp = Int(Date().timeIntervalSince1970)
                self?.chat.append(chatMessage)
                self?.chatTableView.reloadData()
                
                // Clear chat bar
                self?.chatbar.text = nil
            }
        }
    }
    // Perform any additional setup after loading the view.
    //        setupUI()
    //        loadChatHistory()
    
    
    
    
    
    
}
