//
//  SCNetworkManager+extension.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import Foundation
import Alamofire

extension SCNetworkManager{
    func getCarData(completion:@escaping (_ data: Data?,_ isSuccess: Bool)->()){
        let urlString = "https://app-car.carsalesnetwork.com.au/stock/car/test/v1/listing"
        let params = ["username":"test","password":"2h7H53eXsQupXvkz"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (data, res, isSuccess, statusCode, error) in
            completion(data, isSuccess)
        }
    }
    func getCarDetailsData(detailsUrlString: String, completion:@escaping (_ data: Data?,_ isSuccess: Bool)->()){
        let urlString = "https://app-car.carsalesnetwork.com.au\(detailsUrlString)"
        let params = ["username":"test","password":"2h7H53eXsQupXvkz"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (data, res, isSuccess, _, _) in
            completion(data, isSuccess)
        }
    }
}
extension SCNetworkManager{
    func getCarImage(imageUrlString: String, completion:@escaping (_ image: UIImage?)->()){
        guard let url = URL(string: imageUrlString) else{
            completion(nil)
            return
        }
        UIImage.downloadImage(url: url) { (image) in
            completion(image)
        }
    }
}
