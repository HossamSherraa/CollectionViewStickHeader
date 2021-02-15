//
//  CollectionViewHeader.swift
//  CollectionViewStickHeader
//
//  Created by Hossam on 11/24/19.
//  Copyright © 2019 Hossam. All rights reserved.
//

import UIKit
class CollectionViewHeader : UICollectionReusableView {
    var startValue : CGFloat = 0
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingTitleConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var timeTopConstaint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateView: UIView!
    
    @IBOutlet weak var dateViewWidthConstraint: NSLayoutConstraint!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        startValue = imageTopConstraint.constant
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        guard let attributes = layoutAttributes as? StickyAttributes else {return}
        
        imageTopConstraint.constant =  (-1900 - imageTopConstraint.constant)  * (attributes.ratio/3)
        dateViewHeightConstraint.constant =  150 -  ((60) * attributes.ratio)
        
        leadingTitleConstraint.constant = 20 + 100*attributes.ratio
        dateViewWidthConstraint.constant =  -(30 * attributes.ratio)
        timeTopConstaint.constant = 30 - 10*attributes.ratio
       
        dateView.layer.cornerRadius = 20 * attributes.ratio
        
    }
    
   
}
