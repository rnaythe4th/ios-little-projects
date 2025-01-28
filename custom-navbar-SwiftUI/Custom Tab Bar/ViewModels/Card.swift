//
//  Card.swift
//  Custom Tab Bar
//
//  Created by maythe4th on 7.12.21.
//

import SwiftUI

// Card Model and Sample Card Data...

struct Card: Identifiable {
    var id = UUID().uuidString
    var title: String
    var image: String
    var cardColor: String
}

var cards: [Card] = [

    Card(title: "Top selling devices", image: "card1", cardColor: "C2"),
    Card(title: "SwiftUI online Courses", image: "card2", cardColor: "C1")

]
