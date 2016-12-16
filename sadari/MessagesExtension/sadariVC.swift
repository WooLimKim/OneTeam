//
//  BezierView.swift
//  multimedia
//
//  Created by iMac05 on 2016. 11. 22..
//  Copyright © 2016년 iMac05. All rights reserved.
//  멀티미디어 공학과 2011112915 김우림

import UIKit
import QuartzCore
import Messages



class sadariVC: UIViewController, ViewControllerDelegate {
    var conversation : MSConversation?;
    var messageDelegate : DiceGameDelegate? = nil
    var game: SCCGame? = nil
    let modalView = sadariView()
    
    var message: MSMessage? = nil
    func numset(_ num : Int) -> (Int) {
    return num+1
    }
    
    
    
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        self.label1?.text="꽝"
        self.label2?.text="꽝"
        self.label3?.text="당첨"
        self.label4?.text="꽝"
     
      }
    
    
    
    //    let animation:CAKeyframeAnimation
  

//    private func presentVC(for conversation: MSConversation) {
//        let controller: UIViewController
//        controller = instantiateCompactVC()
//        let d = controller as! CompactViewController
//        d.conversation = conversation
//        addChildViewController(controller)
//        
//        view.addSubview(controller.view)
//        
//        controller.didMove(toParentViewController: self)
//    }
    
    
//    private func instantiateCompactVC() -> UIViewController {
//        guard let compactVC = storyboard?.instantiateViewController(withIdentifier: "CompactVC") as? CompactViewController else {
//            fatalError("Can't instantiate CompactViewController")
//        }
//        
//        return compactVC
//    }
    

    
    
    @IBAction func rollTapped(_ sender: AnyObject) {
        setupForNewGame()
       // self.setupForNewGame()
        print("gg")
        self.modalView.messageDelegate = self
        modalView.num=4
        
        
        
    }
    func setupForNewGame() {
        
        game = SCCGame()
         self.messageDelegate?.composeMessage(fromGame: game!, hasWinner: false )
    }
}


