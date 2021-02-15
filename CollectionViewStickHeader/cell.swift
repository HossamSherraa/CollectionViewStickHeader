//
//  cell.swift
//  CollectionViewStickHeader
//
//  Created by Hossam on 11/25/19.
//  Copyright © 2019 Hossam. All rights reserved.
//

import UIKit
class Cell : UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        self.layer.cornerRadius = 0
    }
    
}
