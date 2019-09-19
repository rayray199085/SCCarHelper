//
//  SCCollectionViewCell.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCollectionViewCell: UICollectionViewCell {
    var carDataViewModel: SCCarViewModel?{
        didSet{
            carImageView.setImage(
                urlString: carDataViewModel?.carData.MainPhoto,
                backgroundColor: UIColor.white,
                placeholderImage: nil)
//            carImageView.image = carData?.carImage
            nameLabel.text = carDataViewModel?.carData.Title
            priceLabel.text = carDataViewModel?.carData.Price
            locationLabel.text = carDataViewModel?.carData.Location
        }
    }
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
}
