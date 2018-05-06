//
//  ChatView.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class ChatView: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var chatViewModel = ChatViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.delegate = self
        chatViewModel.chatViewModelDelegate = self
        chatViewModel.loadMessage(answer: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    @IBAction func sendMessage() {
        chatViewModel.loadMessage(answer: messageTextField.text)
        messageTextField.text = ""
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if( messageTextField.isFirstResponder ) {
            view.frame.origin.y = 0 - getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    

}

extension ChatView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.arrayOfMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! MessageViewCell
        
        if chatViewModel.arrayOfMessages[indexPath.row].isBot! {
            cell.userView.isHidden = true
            cell.botView.isHidden = false
            cell.avatarBotImageView.image = chatViewModel.arrayOfMessages[indexPath.row].avatar!
            cell.textMessageBotLabel.text = chatViewModel.arrayOfMessages[indexPath.row].text!
        } else {
            cell.userView.isHidden = false
            cell.botView.isHidden = true
            cell.avatarUserImageView.image = chatViewModel.arrayOfMessages[indexPath.row].avatar!
            cell.textMessageUserLabel.text = chatViewModel.arrayOfMessages[indexPath.row].text!
        }
        
        return cell
    }
    
    func goToBottom() {
        if chatViewModel.arrayOfMessages.count > 0 {
            let indexPath = IndexPath(row: chatViewModel.arrayOfMessages.count-1, section: 0)
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                
                self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.bottom, animated: true)
                
            }) { (completed) in
                
            }
        }
    }
    
}

extension ChatView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == messageTextField {
            chatViewModel.loadMessage(answer: messageTextField.text)
            messageTextField.text = ""
        }
        
        return true
    }
}

extension ChatView: ChatViewModelDelegate {
    func getPlaces() {
        performSegue(withIdentifier: "placeListSegue", sender: self)
    }
    
    func messageLoaded() {
        tableView.reloadData()
        goToBottom()
    }
    
    
    
}
