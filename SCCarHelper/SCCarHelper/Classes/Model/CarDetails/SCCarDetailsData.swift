//
//  SCCarDetailsData.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

struct SCCarDetailsData: Decodable{
    var Id: String?
    var Overview: SCCarDetailsOverview?
    var SaleStatus: String?
    var Comments: String?
}
