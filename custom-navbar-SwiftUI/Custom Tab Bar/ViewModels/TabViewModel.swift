//
//  TabViewModel.swift
//  Custom Tab Bar
//
//  Created by maythe4th on 7.12.21.
//

import SwiftUI

class TabViewModel: ObservableObject {
    
    @Published var currentTab = "Home"
    
    // detail Data
    @Published var currentCard: Card?
    @Published var showDetail: Bool = false
    
}
