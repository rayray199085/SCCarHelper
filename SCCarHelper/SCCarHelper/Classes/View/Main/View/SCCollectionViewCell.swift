//
//  SCCollectionViewCell.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCollectionViewCell: UICollectionViewCell {
    var carData: SCCarData?{
        didSet{
           carImageView.image = carData?.carImage
            nameLabel.text = carData?.Title
            priceLabel.text = carData?.Price
            locationLabel.text = carData?.Location
        }
    }
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
}
