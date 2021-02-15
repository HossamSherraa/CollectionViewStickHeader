//
//  StickyHeaderLayout.swift
//  CollectionViewStickHeader
//
//  Created by Hossam on 11/23/19.
//  Copyright © 2019 Hossam. All rights reserved.
//

import UIKit
class StickyHeaderLayout : UICollectionViewLayout{
   
    var standardHeaderSize : CGSize {
        .init(width: self.collectionView!.bounds.width, height: 650)
    }
    

    var stickyHeaderSize : CGSize {
        .init(width: self.collectionView!.bounds.width, height: 200)
    }
    
    var space : CGFloat = 0{
        didSet{
            invalidateLayout()
        }
    }
    var numberOfItems : Int {
        return collectionView?.numberOfItems(inSection: 0) ?? 0
    }
    var collectionViewHeight : CGFloat = 0
    override var collectionViewContentSize: CGSize {
        .init(width: collectionView!.bounds.width , height: collectionViewHeight)
    }
    var numberOfColomns : CGFloat = 2
   
    
    var cache = [StickyAttributes]()
    
    override func prepare() {
        super.prepare()
        cache.removeAll()
        
        
        guard let collectionView = self.collectionView else {return}
        let contentOffset =  collectionView.contentOffset.y
        //HeaderAttributes
        let header = StickyAttributes(forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, with: .init(item: 0, section: 0))
        let headerHeightOffset = standardHeaderSize.height - stickyHeaderSize.height
       
        var margins : CGFloat = 30
        var itemSize : CGFloat {
            ( (collectionView.bounds.width - (margins)  - space*2) / 2) }
        var standardHeightContentOffset = min(max(0 , contentOffset*1.7), standardHeaderSize.height)
     
        
        let ratio =  1 - ((standardHeaderSize.height - standardHeightContentOffset ) / standardHeaderSize.height )
     

        let headerHeight = standardHeaderSize.height - (ratio * headerHeightOffset)
       
            header.frame = .init(x: 0, y: contentOffset, width: collectionView.bounds.width, height: headerHeight)
       
        header.ratio = ratio
        
        margins = margins - ((margins+20) * ratio)
        
        header.zIndex = -100
        if ratio == 1 {
             header.zIndex = 100
        }
        
        cache.append(header)

        //CellsAttributes
        var frame = CGRect.zero
        var x : CGFloat = margins/2 + space
        var y : CGFloat  = standardHeaderSize.height - 30
        var maxX : CGFloat {
                     ( margins / 2 ) + space + (itemSize*2) - 1}
        
        for item in 0..<numberOfItems{
            let indexPath = IndexPath(item: item, section: 0)
            let cellAttributes = StickyAttributes.init(forCellWith: indexPath)
            frame = .init(x: x  , y: y, width: itemSize, height: itemSize)
            cellAttributes.frame = frame
            if frame.maxX >= maxX{
                x = margins/2 + space
                y += space + itemSize
            }
            else {
                x += space + itemSize
                }
            collectionViewHeight = frame.maxY
            cache.append(cellAttributes)
           
               }
        
        
        
    }
    
    
    override class var layoutAttributesClass: AnyClass{
        StickyAttributes.self
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        cache
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    
  
}
