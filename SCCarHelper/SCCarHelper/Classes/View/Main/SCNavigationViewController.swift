//
//  SCNavigationViewController.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCNavigationViewController: UINavigationController {
    override var shouldAutorotate: Bool{
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        if children.count < 2{
            return .all
        }
        return .portrait
    }
}
