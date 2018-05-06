//
//  ChatViewModel.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

protocol ChatViewModelDelegate: class {
    func messageLoaded()
    func getPlaces()
}

class ChatViewModel {
    
    weak var chatViewModelDelegate: ChatViewModelDelegate?
    
    var arrayOfMessages = [Message]()
    
    func loadMessage(answer:String?) {
        
        if answer == nil {
            arrayOfMessages.append(getBotMessage(userAnswer: nil))
        } else {
            arrayOfMessages.append(Message(text: answer!, isBot: false, avatar: #imageLiteral(resourceName: "user")))
            arrayOfMessages.append(getBotMessage(userAnswer: answer))
        }
        chatViewModelDelegate?.messageLoaded()
    }
    
    
    func getBotMessage(userAnswer: String?) -> Message {
        
        let answer = userAnswer?.lowercased()
        switch answer {
        case nil:
            return Message(text: "Olá \(String(describing: UserSingleton.shared.name)) diga-me mais sobre você. Digite \"vamos\" pra gente iniciar.", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "calmo":
            return Message(text: "Gosta de curtir sozinho(a)🚶🏽‍♂️ 🚶🏾‍♀️ ou acompanhado(a) 💃🏼🕺🏼?", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "badalado":
            return Message(text: "Gosta de curtir sozinho(a)🚶🏽‍♂️ 🚶🏾‍♀️ ou acompanhado(a) 💃🏼🕺🏼?", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "sozinho":
            return Message(text: "Cerveja🍻 ou Suco🥤?", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "acompanhado":
            return Message(text: "Cerveja🍻 ou Suco🥤?", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "cerveja":
            return Message(text: "Caminhada🏃🏽‍♀️🏃🏽‍♂️ ou Sessão de cinema📽🎞?", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "suco":
            return Message(text: "Caminhada🏃🏽‍♀️🏃🏽‍♂️ ou Sessão de cinema📽🎞?", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "vamos":
            return Message(text: "Escolha entre lugar badalado ou calmo.", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        case "cinema":
            self.chatViewModelDelegate?.getPlaces()
            return Message()
        case "caminhada":
            self.chatViewModelDelegate?.getPlaces()
            return Message()
        default:
            return Message(text: "Não etendi sua resposta.", isBot: true, avatar: #imageLiteral(resourceName: "bot"))
        }
        
    }
    
}
