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
            MetaPageView()
            .tabItem {
                Image(systemName: "star")
                Text("M")
            }

            MatchView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("探索")
                }
            
            Text("P")
                .tabItem  {
                Image(systemName: "star.fill")
                Text("发布")
            }
            
            Text("Inbox")
                .tabItem  {
                Image(systemName: "star.fill")
                Text("消息")
            }
            
            Text("Profile")
                .tabItem  {
                Image(systemName: "star.fill")
                Text("我")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
