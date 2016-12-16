//
//  ExpandViewDelegate.swift
//  sadariApp
//
//  Created by iMac05 on 2016. 12. 15..
//  Copyright © 2016년 iMac05. All rights reserved.
//

import Messages
import Foundation

protocol ExpandViewDelegate {
    func expand(toPresentationStyle presentationStyle: MSMessagesAppPresentationStyle, tutorial: Bool)
    func getPresentationStyle() -> MSMessagesAppPresentationStyle
    
}
protocol DiceGameDelegate {
    //func composeMessage(forScore score: Int, totalScore: Int, oppScore: Int, withWinner: Bool)
  func composeMessage(fromGame game: SCCGame, hasWinner: Bool)
}
