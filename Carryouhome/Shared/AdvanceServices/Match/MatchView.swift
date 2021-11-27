//
//  MatchView.swift
//  Carryouhome (iOS)
//
//  Created by fanghe on 2021/10/24.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
        HStack {
            Button.init(action: {}, label: {
                Text("上一个")
            })
            VStack {
                Image(systemName: "gift.fill")
                    .resizable()
                    .background(Color.green)
                    .cornerRadius(50)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("昵称")
                Text("性别")
                Text("简介")
                
                HStack{
                    Text("不感兴趣")
                    Text("感兴趣")
                }
            }
            Button.init(action: {}, label: {
                Text("下一个")
            })
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
