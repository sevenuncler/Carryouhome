//
//  SlideViewCell.swift
//  Carryouhome
//
//  Created by fanghe on 2021/10/1.
//
import UIKit

protocol SlideViewProtocol {
    func refresh(model: Any)
    func willDisplay()
    func didDisplay()
    func willEndDisplay()
    func didEndDisplay()
}

class SlideViewCell: UICollectionViewCell, SlideViewProtocol {
    var realContentView: SlideViewProtocol?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: SlideViewProtocol
    
    func refresh(model: Any) {
        if self.realContentView == nil {
        }
    }
    
    func willDisplay() {
        self.realContentView?.willDisplay()
    }
    
    func didDisplay() {
        self.realContentView?.didDisplay()
    }
    
    func willEndDisplay() {
        self.realContentView?.willEndDisplay()
    }
    
    func didEndDisplay() {
        self.realContentView?.didEndDisplay()
    }
}
