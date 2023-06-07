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
            
            chatTableView.register(UINib(nibName: "chatMessage", bundle: nil), forCellReuseIdentifier: "chatMessage")
            
            teamId = team?.id
            
            chatTableView.dataSource = self
            chatTableView.delegate = self
            
            realmInstance.safeUser { user in
                currentUser = user
            }
            
            if let teamId = teamId {
                fireGetChatAsync(teamId: teamId) { [weak self] chats in
                    self?.chat = chats ?? []
                    self?.chatTableView.reloadData()
                    
                    if chats!.isEmpty {
                        let lastRowIndex = IndexPath(row: chats!.count - 1, section: 0)
                        self?.chatTableView.scrollToRow(at: lastRowIndex, at: .bottom, animated: true)
                    }
                }
            }
        
        
//        chatLog = realmInstance.objects(Chat.self).sorted(byKeyPath: "timestamp")
//        chat = Array(chatLog)
//        print(chat)
//
        DispatchQueue.main.async {
            self.chatTableView.reloadData()
        }
       
            
            
        if !chat.isEmpty {
            let lastRowIndex = IndexPath(row: chat.count - 1, section: 0)
            chatTableView.scrollToRow(at: lastRowIndex, at: .bottom, animated: true)
        }
      
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
        
        cell.configure(with: chatMessage)
        
        return cell
    }
    @IBAction func sendPressed(_ sender: Any) {
        guard let messageText = chatbar.text, !messageText.isEmpty, let teamId = teamId else {
                    return
                }
                
                let chatRef = Database.database().reference().child("chat").child(teamId)
                
                let chatObject = Chat()
                chatObject.messageText = messageText
                chatObject.timestamp = Int(Date().timeIntervalSince1970)
                chatObject.senderId = currentUser?.id
                chatObject.senderName = currentUser?.name
                // Set any additional properties of the Chat object
                
                let newMessageRef = chatRef.childByAutoId()
        newMessageRef.setValue(chatObject.toDictionary()) { [weak self] error, _ in
                    if let error = error {
                        print("Failed to send message to Firebase: \(error)")
                        return
                    }
                    
                    self?.chat.append(chatObject)
                    self?.chatTableView.reloadData()
                    
                    self?.chatbar.text = nil
                }
            }
}
