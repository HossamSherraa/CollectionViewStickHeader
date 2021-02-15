//
//  CollectionViewController.swift
//  CollectionViewStickHeader
//
//  Created by Hossam on 11/23/19.
//  Copyright © 2019 Hossam. All rights reserved.
//

import UIKit
class CollectionViewController : UICollectionViewController {
    var layout = StickyHeaderLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        collectionView.backgroundColor = .black
          }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.label.text = "\(indexPath.row + 1 )"
        
        switch indexPath.row {
        case 0 :
            cell.layer.cornerRadius = 20
            cell.layer.maskedCorners = [.layerMinXMinYCorner ]
        case 1 :
            cell.layer.cornerRadius = 20
            cell.layer.maskedCorners = [.layerMaxXMinYCorner ]
        default:return cell
        }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
    }
    
    
   
    
    
}
