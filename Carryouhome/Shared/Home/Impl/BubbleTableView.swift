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
        return bubbles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BubbleCell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath) as? BubbleCell ?? BubbleCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "reuse")
        cell.refresh(title: bubbles[indexPath.row].title)
        return cell
    }
    
}

class BubbleCell: UITableViewCell {
    var title: UILabel
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        title = UILabel();
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(title)


    }
    
    required init?(coder: NSCoder) {
        title = UILabel();
        super.init(coder: coder)
        self.contentView.addSubview(title)

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
}
