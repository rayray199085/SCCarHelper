//
//  SCCarData.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCarData: NSObject {
    @objc var DetailsUrl: String?
    @objc var Id: String?
    @objc var Location: String?
    @objc var MainPhoto: String?
    @objc var Price: String?
    @objc var Title: String?
    @objc var carImage: UIImage?
    
    override var description: String{
        return yy_modelDescription()
    }
}
