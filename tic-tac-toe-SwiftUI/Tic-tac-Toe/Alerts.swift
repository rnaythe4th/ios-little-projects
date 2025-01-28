//
//  Alerts.swift
//  Tic-tac-Toe
//
//  Created by maythe4th on 12.11.21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win"),
                                    message: Text("You are so smart"),
                                    buttonTitle: Text("Hell yeah!"))
    
    static let computerWin = AlertItem(title: Text("You lost"),
                                       message: Text("You are debil!"),
                                       buttonTitle: Text("I'm daun"))
    
    static let Draw = AlertItem(title: Text("Draw"),
                                message: Text("Try harder"),
                                buttonTitle: Text("Ladno"))
}
