//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by iMac05 on 2016. 12. 10..
//  Copyright © 2016년 iMac05. All rights reserved.
//


import UIKit
import Messages



class MessagesViewController: MSMessagesAppViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Conversation Handling
    
    
     private func presentVC(for conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        let controller: UIViewController
        
        if presentationStyle == .compact {
            controller = instantiateCompactVC()

        } else {
           controller = instantiateExpandedVC(forConversation: conversation)
        
            
        }
        
        for child in childViewControllers {
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
        
        addChildViewController(controller)

        view.addSubview(controller.view)
 
        controller.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        controller.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        controller.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        controller.didMove(toParentViewController: self)
    }
    
    private func instantiateCompactVC() -> UIViewController {
        guard let compactVC = storyboard?.instantiateViewController(withIdentifier: "CompactVC") as? CompactViewController else {
            fatalError("Can't instantiate CompactViewController")
        }
        compactVC.delegate = self
        return compactVC
    }
    
    private func instantiateExpandedVC(forConversation conversation: MSConversation) -> UIViewController {
        guard let expandedVC = storyboard?.instantiateViewController(withIdentifier: "ExpandedVC") as? sadariVC else {//다이스 게임 뷰컨트롤의 SCC
            fatalError("No dice game VC man")}
        
        
                expandedVC.message = conversation.selectedMessage
                print("message 전달")
        
        expandedVC.label1?.text="꽝"
        expandedVC.label2?.text="꽝"
        expandedVC.label3?.text="당첨"
        expandedVC.label4?.text="꽝"
        
        expandedVC.messageDelegate = self
        

        return expandedVC
    }
    override func willBecomeActive(with conversation: MSConversation) {
        presentVC(for: conversation, with: presentationStyle)     }
    
    
    override func didResignActive(with conversation: MSConversation) {
        
    }
    
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        
    }
    
    override func didSelect(_ message: MSMessage, conversation: MSConversation) {
        guard let conversation = activeConversation else {
            fatalError("No active conversation or something")
        }
        presentVC(for: conversation, with: presentationStyle)
    }
    

    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        guard let conversation = activeConversation else {
            fatalError("Expected the active conversation")
        }
        
        presentVC(for: conversation, with: presentationStyle)
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        
    }
}
extension MessagesViewController: DiceGameDelegate { //델리게이트사용.얘가 애들을 조정하겠다는 의미구만
           func composeMessage(fromGame game: SCCGame, hasWinner: Bool){
            let convo = activeConversation ?? MSConversation()
            let session = convo.selectedMessage?.session ?? MSSession()

            let layout = MSMessageTemplateLayout()
            layout.caption = "The Ladder"
            layout.image = UIImage(named: "222.jpeg")
            let message = MSMessage(session: session)
        
            guard let expandedVC = storyboard?.instantiateViewController(withIdentifier: "ExpandedVC") as? sadariVC else {//다이스 게임 뷰컨트롤의 SCC
                fatalError("No dice game VC man")}
        
        
    
            message.layout = layout
            var components = URLComponents()
            convo.insert(message) { (error) in
                //self.requestPresentationStyle(.compact)
                guard error == nil else {
                    fatalError("error in inserting message into conversation")
                }
            }
            dismiss()
    }
}




extension MessagesViewController: ExpandViewDelegate {
    func expand(toPresentationStyle presentationStyle: MSMessagesAppPresentationStyle, tutorial: Bool) {
               requestPresentationStyle(presentationStyle)
        
    }
    func getPresentationStyle() -> MSMessagesAppPresentationStyle {
        return self.presentationStyle
    }
}
