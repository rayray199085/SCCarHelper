//
//  SCImageCollectionViewCell.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCImageCollectionViewCell: UICollectionViewCell {
    var carImage: UIImage?{
        didSet{
            carImageView.image = carImage
        }
    }
    @IBOutlet weak var carImageView: UIImageView!
}
