//
//  VideoPlayView.swift
//  Carryouhome (iOS)
//
//  Created by fanghe on 2021/9/26.
//

import SwiftUI

struct VideoPlayView: View {
    var body: some View {
        Text("")
        Service("MediaInterface")!.doAction(action: "",params: "") as? Text
//            List {
//                background(Color.red)
//            }.offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
    }
}

struct VideoPlayView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayView()
    }
}
