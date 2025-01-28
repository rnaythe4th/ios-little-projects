//
//  CustomTabBar.swift
//  Custom Tab Bar
//
//  Created by maythe4th on 7.12.21.
//

import SwiftUI

struct CustomTabBar: View {
    @StateObject var tabData = TabViewModel()
    
    // Hiding Tab View
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $tabData.currentTab) {
            
            Home(animation: animation)
                .environmentObject(tabData)
                .tag("Home")
            
            Text("Purchased")
                .tag("Purchased")
            
            Text("Settings")
                .tag("Settings")
        }
        .overlay(
            HStack {
                
                TabBarButton(title: "Home", image: "house", animation: animation)
                
                TabBarButton(title: "Purchased", image: "purchased.circle", animation: animation)
                
                TabBarButton(title: "Settings", image: "gear.circle", animation: animation)
                
            }
                .environmentObject(tabData)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(.thinMaterial, in: Capsule())
                .padding(.horizontal,20)
                .padding(.bottom, 8)
            // shadow
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
            // Hiding Tab Bar
                .offset(y: tabData.showDetail ? 250 : 0)
            ,alignment: .bottom
        )
        
        // Detail View
        .overlay(
            DetailView(animation: animation)
                .environmentObject(tabData)
        )
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

// TabBar Button
struct TabBarButton: View {
    var title: String
    var image: String
    // for slide tab animation
    var animation: Namespace.ID
    @EnvironmentObject var tabData: TabViewModel
    var body: some View {
        Button {
            withAnimation {
                tabData.currentTab = title
            }
        } label: {
            VStack {
                Image(systemName: image)
                    .font(.title2)
                // setting same height for all images...
                // to avoiid the animation glitch...
                    .frame(height: 18)
                
                Text(title)
                    .font(.caption.bold())
            }
            .foregroundColor(tabData.currentTab == title ? Color("Tab") : .gray)
            .frame(maxWidth: .infinity)
            .overlay(
                ZStack{
                    
                    // showing only for current tab
                    if tabData.currentTab == title {
                        TabIndicator()
                            .fill(LinearGradient(gradient: .init(colors: [
                                Color("Tab").opacity(0.2),
                                Color("Tab").opacity(0.1),
                                .clear
                            ]),
                                                 startPoint: .top,
                                                 endPoint: .bottom))
                        // Geometry Effect...
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .padding(.top, -10)
                            .padding(.horizontal, 8)
                            
                    }
                    
                }
            )
        }
    }
}

// Custom Tab Lightning indicator
// Shape

struct TabIndicator: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height))
            path.addLine(to: CGPoint(x: 10, y: rect.height))
        }
    }
}
