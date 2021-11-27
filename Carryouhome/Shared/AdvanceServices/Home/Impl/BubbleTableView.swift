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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("scrollViewDidScroll:" + "\(scrollView.contentOffset)")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging:" + "\(scrollView.contentOffset)")
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("scrollViewDidZoom:" + "\(scrollView.contentOffset)")

    }


    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging:" + "\(scrollView.contentOffset)")
        
    }

 
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewWillEndDragging:" + "\(scrollView.contentOffset)")
    }

    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillEndDragging:" + "\(scrollView.contentOffset)")
    }

     func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) // called when scroll view grinds to a halt
    {
        print("scrollViewWillEndDragging:" + "\(scrollView.contentOffset)")
    }

    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
    {
        print("scrollViewWillEndDragging:" + "\(scrollView.contentOffset)")
    }
    
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? // return a view that will be scaled. if delegate returns nil, nothing happens
//    {
//        print("scrollViewWillEndDragging:" + "\(scrollView.contentOffset)")
//    }

    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) // called before the scroll view begins zooming its content
    {
        print("scrollViewWillBeginZooming:" + "\(scrollView.contentOffset)")
    }

    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) // scale between minimum and maximum. called after any 'bounce' animations
    {
        print("scrollViewDidEndZooming:" + "\(scrollView.contentOffset)")
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool // return a yes if you want to scroll to the top. if not defined, assumes YES
    {
        print("scrollViewShouldScrollToTop:" + "\(scrollView.contentOffset)")
        return true
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView)
    {
        print("scrollViewDidScrollToTop:" + "\(scrollView.contentOffset)")
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
    }
    
    @objc func increseOffsetY() {
        self.offsetY += 0.75
        
        self.tableView.setContentOffset(CGPoint.init(x: 0, y: self.offsetY), animated: false)
//        print("offsetY"+" "+"\(self.offsetY)")
    }
}
