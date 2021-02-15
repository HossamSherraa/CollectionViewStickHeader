//
//  StickyAttributes.swift
//  CollectionViewStickHeader
//
//  Created by Hossam on 11/25/19.
//  Copyright © 2019 Hossam. All rights reserved.
//

import UIKit
class StickyAttributes : UICollectionViewLayoutAttributes {
    var ratio : CGFloat = 0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let stickyAttributes = super.copy(with: zone) as! StickyAttributes
        stickyAttributes.ratio = self.ratio
        return stickyAttributes
    }
   
    
}
