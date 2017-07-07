//
//  CollectionViewSectionHeader.swift
//  SwiftDemo
//
//  Created by James Tang on 23/7/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import UIKit

class CollectionViewSectionHeader: UICollectionReusableView {
    
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.addSubview(label)
        
        //adjust the start of text
        var frm = self.bounds
        frm.origin.x = 10.0
        frm.size.width -= 10.0
        label.frame = frm
        
        label.text = UICollectionElementKindSectionHeader
    }
}
