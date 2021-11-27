//
//  ContentView.swift
//  Shared
//
//  Created by fanghe on 2021/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VideoPlayView()
            .tabItem {
                Image(systemName: "star")
                Text("Home")
            }

            MatchView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Discover")
                }
            
            Text("P")
                .tabItem  {
                Image(systemName: "star.fill")
                Text("Publish")
            }
            
            Text("Inbox")
                .tabItem  {
                Image(systemName: "star.fill")
                Text("Inbox")
            }
            
            Text("Profile")
                .tabItem  {
                Image(systemName: "star.fill")
                Text("Profile")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
