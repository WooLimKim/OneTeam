//
//  CompactViewController.swift
//  sadariApp
//
//  Created by iMac05 on 2016. 12. 12..
//  Copyright © 2016년 iMac05. All rights reserved.
//

import UIKit
import Messages

class CompactViewController: UIViewController {
    
    var conversation : MSConversation?;
     var voteData:SCCGame?
    var abc = 0
    var delegate : ExpandViewDelegate? = nil
    
    @IBAction func beginButton(_ sender: AnyObject) {
        self.delegate?.expand(toPresentationStyle: .expanded, tutorial: false)
        
 
    }
    @IBAction func beginButton1(_ sender: AnyObject) {
       self.delegate?.expand(toPresentationStyle: .expanded, tutorial: false)
    }
    @IBAction func beginButton2(_ sender: AnyObject) {
     self.delegate?.expand(toPresentationStyle: .expanded, tutorial: false)
    }
    
//    private func presentVC(for conversation: MSConversation) {
//        let controller: UIViewController
//        controller = instantiateExpandedVC()
//        let d = controller as! sadariVC
//        d.conversation = conversation
//        //PresentationStyle
//        addChildViewController(controller)
//        view.addSubview(controller.view)
//    
//       // controller.didMove(toParentViewController: self)
//        
//        print("abc")
//    }
//    
    
//    private func instantiateExpandedVC() -> UIViewController {
//        guard let expandedVC = storyboard?.instantiateViewController(withIdentifier: "ExpandedVC") as? sadariVC else {
//            fatalError("Can't instantiate ExpandedViewController")
//        }
//        return expandedVC
//    }
//    
//    
}
