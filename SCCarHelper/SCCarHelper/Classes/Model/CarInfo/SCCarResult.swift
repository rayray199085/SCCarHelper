//
//  SCCarResult.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import YYModel

class SCCarResult: NSObject {
    @objc var Result: [SCCarData]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["Result": SCCarData.self]
    }
    override var description: String{
        return yy_modelDescription()
    }
}
