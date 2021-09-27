//
//  BubbleList.swift
//  Carryouhome
//
//  Created by fanghe on 2021/9/27.
//

import Foundation
import UIKit
import SwiftUI

struct BubbleList: UIViewRepresentable {
    typealias UIViewType = UIView
    @Binding var bubbles: [BubbleModel]

    func makeCoordinator() -> BubbleListCoordinator {
        return BubbleListCoordinator(bubbles: $bubbles)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = BubbleTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 120))
        view.tableView.delegate = context.coordinator
        view.tableView.dataSource = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
