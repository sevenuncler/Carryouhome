//
//  CircleBubble.swift
//  Carryouhome
//
//  Created by fanghe on 2021/9/27.
//

import SwiftUI
struct BubbleRow: View {
    var bubbleModel: BubbleModel
    var body: some View {
        Text(bubbleModel.title)
    }
}

struct CircleBubbleList: View {
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
    @State var currentIndex: NSInteger = 0
    @State var isAnimation: Bool = true
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        let currentOffset = CGFloat(-currentIndex) * (40)
        let list = List(0..<100000) { idx in
            BubbleRow(bubbleModel: datas[idx % datas.count])
        }
        VStack {
            list
        }
        .offset(y: currentOffset)
        .onChange(of: currentIndex, perform: { value in
            isAnimation = true
            if value == 0 {
                currentIndex = 0
            } else if value == datas.count + 1 {
                isAnimation = false
                currentIndex = 0
            }
        })
        .onReceive(timer, perform: { _ in
            currentIndex += 1
        })
        .background(Color.red)
        .clipped()
        .animation(isAnimation ? .spring() : .none)
    }
}

struct CircleBubble_Previews: PreviewProvider {
    static var previews: some View {
        CircleBubbleList()
    }
}
