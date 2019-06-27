//
//  SCCarDetailsResult.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCarDetailsResult: NSObject {
    @objc var Result: [SCCarDetailsData]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["Result": SCCarDetailsData.self]
    }
    override var description: String{
        return yy_modelDescription()
    }
}
