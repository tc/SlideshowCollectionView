//
//  PlayerCollectionView.swift
//
//  Created by Tommy Chheng on 10/14/15.
//  Copyright © 2015 Tommy Chheng. All rights reserved.
//

import UIKit


class PlayerCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate  {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var items:[String]? {
        didSet {
            self.collectionView?.reloadData()
            if (self.collectionView == nil) {
                NSLog("CollectionView is still nil in items")
            } else {
                NSLog("CollectionView is not nil")
            }
        }
    }
    
    override func awakeAfterUsingCoder(aDecoder: NSCoder) -> AnyObject? {
        if self.subviews.count == 0 {
            return loadNib()
        }
        return self
    }
    
    private func loadNib() -> PlayerCollectionView {
        return NSBundle.mainBundle().loadNibNamed("PlayerCollectionView", owner: nil, options: nil)[0] as! PlayerCollectionView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if (self.collectionView == nil) {
            NSLog("CollectionView is nil")
        }
        
        self.collectionView?.registerNib(UINib(nibName: "PlayerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PlayerCollectionCell")
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.pagingEnabled = true
        
        self.pageControl?.numberOfPages = self.items?.count ?? 0
        self.collectionView?.reloadData()
    }
    
    // MARK - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("PlayerCollectionCell", forIndexPath: indexPath) as! PlayerCollectionCell
        
        cell.text = items?[indexPath.row]
        
        return cell
    }
    
    // MARK - Player Movement
    func goToPage(index:Int) {
        if (index < items?.count ?? 0) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            self.collectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
            self.pageControl?.currentPage = index
        }
    }
}
