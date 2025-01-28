//
//  Home.swift
//  Custom Tab Bar
//
//  Created by maythe4th on 7.12.21.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var tabData: TabViewModel
    
    // For Animation
    var animation: Namespace.ID
    
    
    var body: some View {
            
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 18) {
                Text("Nu tipa Welcome")
                    .font(.system(size: 35).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                // Cards...
                
                ForEach(cards) {card in
                    
                    Button {
                        withAnimation(.spring()){
                            tabData.currentCard = card
                            tabData.showDetail = true
                        }
                        
                    } label: {
                        VStack(spacing: 15) {
                            Image(card.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                                .padding()
                            Text(card.title)
                                .font(.title2.bold())
                                .matchedGeometryEffect(id: "\(card.id)TITLE", in: animation)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [
                                    Color("\(card.cardColor)1"),
                                    Color("\(card.cardColor)2"),
                                    Color("\(card.cardColor)3")
                                    
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: card.id + "BG", in: animation)
                        )
                        .foregroundColor(.white)
                    }
                    .buttonStyle(CardButtonStyle())
                }
                    
            }
            .padding()
            // Bottom Padding to sho the content available on bottom
            // safe area edge is not working with scrollView
            // It's only working with scrollView
            .padding(.bottom, 80)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Custom Hoverable Card Button
struct CardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
        //decreasing scale when clicked
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.easeIn, value: configuration.isPressed)
    }
}
