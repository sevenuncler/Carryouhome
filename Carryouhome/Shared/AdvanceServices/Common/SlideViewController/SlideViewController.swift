//
//  SlideViewController.swift
//  Carryouhome
//
//  Created by fanghe on 2021/10/1.
//

import UIKit

class SlideViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    var collectionView: UICollectionView
    var store: SlideStore
    init(store: SlideStore) {
        self.store = store
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        super.init(nibName: nil, bundle: nil)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func setup() {
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        flowLayout.itemSize = view.bounds.size
        collectionView.frame = self.view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SlideViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(SlideViewCell.self))
        view.addSubview(collectionView)
    }
    
    // MARK: UICollectionViewDelegate & UICollectionViewDatasource
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(SlideViewCell.self), for: indexPath) as? SlideViewCell ?? SlideViewCell.init(frame: CGRect.zero)
        cell.refresh(model: "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.store.datas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let slideViewCell = cell as? SlideViewCell
        slideViewCell?.willDisplay()
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let slideViewCell = cell as? SlideViewCell
        slideViewCell?.didEndDisplay()
    }
    
}
