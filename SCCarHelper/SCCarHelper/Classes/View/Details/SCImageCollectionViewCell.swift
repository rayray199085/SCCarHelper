//
//  SCImageCollectionViewCell.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCImageCollectionViewCell: UICollectionViewCell {
    var carImageUrlString: String?{
        didSet{
            carImageView.setImage(
                urlString: carImageUrlString,
                backgroundColor: UIColor.white,
                placeholderImage: nil)
        }
    }
    @IBOutlet weak var carImageView: UIImageView!
}
