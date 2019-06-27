//
//  SCCarDetailsOverview.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCarDetailsOverview: NSObject {
    @objc var Location: String?
    @objc var Price: String?
    @objc var Photos: [String]?
    @objc var carImages: [UIImage]?
    
    override var description: String{
        return yy_modelDescription()
    }
}
