//
//  BubbleTableView.swift
//  Carryouhome
//
//  Created by fanghe on 2021/9/27.
//

import Foundation
import UIKit
import SwiftUI



class BubbleListCoordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
    @Binding var bubbles: [BubbleModel]
    init(bubbles: Binding<[BubbleModel]>) {
        _bubbles = bubbles
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bubbles.count * 100000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BubbleCell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath) as? BubbleCell ?? BubbleCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "reuse")
        cell.refresh(title: bubbles[indexPath.row % bubbles.count].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 1
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
    }
    
}

class BubbleCell: UITableViewCell {
    var title: UILabel
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        title = UILabel();
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(title)
    }
    
    required init?(coder: NSCoder) { // 可失败构造函数
        title = UILabel();
        super.init(coder: coder)

    }
    
    override func layoutSubviews() {
        title.frame = self.bounds
    }
    
    func refresh(title: String) {
        self.title.text = title
    }
}

class BubbleTableView: UIView {
    var tableView: UITableView
    var timer: Timer?
    var offsetY: CGFloat = 0
    var linker: CADisplayLink?
    override init(frame: CGRect) {
        tableView = UITableView(frame: frame, style: UITableView.Style.plain)
        tableView.register(BubbleCell.self, forCellReuseIdentifier: "reuse")
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
        self.addSubview(self.tableView)
    }
    
    required init?(coder: NSCoder) {
        tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.register(BubbleCell.self, forCellReuseIdentifier: "reuse")
        super.init(frame: CGRect.zero)
    }
    
    deinit {
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
    }
    
    func startLoop(_ time: CGFloat) {
        linker = CADisplayLink.init(target: self, selector: #selector(increseOffsetY))
        linker?.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
        linker?
    }
    
    @objc func increseOffsetY() {
        self.offsetY += 0.75
        
        self.tableView.setContentOffset(CGPoint.init(x: 0, y: self.offsetY), animated: false)
        print("offsetY"+" "+"\(self.offsetY)")
    }
}
