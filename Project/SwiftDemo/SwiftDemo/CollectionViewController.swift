//
//  ViewController.swift
//  SwiftDemo
//
//  Created by James Tang on 16/7/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var items: [String] = ["CSStickyHeaderFlowLayout basic example", "Example to initialize in code", "As well as in Swift", "Please enjoy!", "HaHa!", "Way cool!", "Ok, how is this?", "I like it", "Exciting to watch", "Don't forget to call me"]
    
    fileprivate var layout : CSStickyHeaderFlowLayout? {
        return self.collectionView?.collectionViewLayout as? CSStickyHeaderFlowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.backgroundColor = UIColor.white
        
        // This property is available in iOS 10. Disable dynamic position of `SupplementaryView` to avoid crash / exception.
        /** Obj-C
        if ([self.collectionView respondsToSelector:@selector(setPrefetchingEnabled:)]) {
            self.collectionView.prefetchingEnabled = false;
        }
        **/
        // Swift 3
        if #available(iOS 10, *) {
            collectionView?.isPrefetchingEnabled = false  //default is true
        }
        
        // Setup Cell
        self.collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        let insetLeft: CGFloat = 10.0
        let insetRight: CGFloat = 10.0
        let insetTop: CGFloat = 2.0
        let insetBottom: CGFloat = 2.0
        self.layout?.sectionInset = UIEdgeInsetsMake(insetTop, insetLeft, insetBottom, insetRight)
        self.layout?.itemSize = CGSize(width: self.view.frame.size.width - insetLeft - insetRight, height: 44.0)

        // Setup Parallax Header (Suppliementary View)
        self.collectionView?.register(CollectionParallaxHeader.self, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: "parallaxHeader")
        self.layout?.parallaxHeaderReferenceSize = CGSize(width: self.view.frame.size.width, height: 300.0)
        
        // Setup Section Header
        self.collectionView?.register(CollectionViewSectionHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "sectionHeader")
        self.layout?.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 40.0)
    }
    
    //MARK: UICollectionViewDataSource
    
    // Cell
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.text = self.items[indexPath.row]
        return cell
    }
    
    // Parallax Header
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == CSStickyHeaderParallaxHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "parallaxHeader", for: indexPath)
            return view
        }
        else if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath)
            view.backgroundColor = UIColor.lightGray
            return view
        }
        return UICollectionReusableView()
    }
    
    /** not doing anything
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    **/
}

