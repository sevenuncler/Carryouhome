//
//  VideoPlayView.swift
//  Carryouhome (iOS)
//
//  Created by fanghe on 2021/9/26.
//

import SwiftUI
// 1. 左下角滚动弹幕列表
// 2. 匀速滚动
// 3. 循环
// 4. 图片
// 5. 位置
struct VideoPlayView: View {
    @State var datas: Array<BubbleModel> = [BubbleModel(title: "1"),
                                        BubbleModel(title: "2"),
                                        BubbleModel(title: "3"),
                                        BubbleModel(title: "4"),
                                        BubbleModel(title: "5"),
                                        BubbleModel(title: "6"),
                                        BubbleModel(title: "7"),
                                        BubbleModel(title: "8"),
                                        BubbleModel(title: "9"),
                                        BubbleModel(title: "10"),
                                        BubbleModel(title: "11"),
                                        BubbleModel(title: "12")]
    var body: some View {
        VStack {
            Spacer()
            HStack {
                
                BubbleList(bubbles: $datas)
                    .frame(width: 150, height: 120, alignment: .bottomLeading)
                    .offset(x: 16.0)
                Spacer()
            }
        }
    }
}

struct VideoPlayView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayView()
    }
}
