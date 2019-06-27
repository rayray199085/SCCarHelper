//
//  SCCarViewModel.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import Foundation

class SCCarViewModel{
    var result: SCCarResult?
    var detailsUrlString: String?
    var detailsResult: SCCarDetailsResult?
    
    // get basic car information
    func loadCarData(completion:@escaping (_ isSuccess: Bool)->()){
        SCNetworkManager.shared.getCarData { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
            }
            guard let dict = dict,
                  let result = SCCarResult.yy_model(with: dict) else{
                completion(false)
                return
            }
            let group = DispatchGroup()
            for data in result.Result ?? []{
                guard let imageUrlString = data.MainPhoto else{
                    continue
                }
                group.enter()
                SCNetworkManager.shared.getCarImage(imageUrlString: imageUrlString, completion: { (image) in
                    data.carImage = image
                    group.leave()
                })
            }
            group.notify(queue: DispatchQueue.main, execute: {
                self.result = result
                completion(isSuccess)
            })
        }
    }
    
    func loadCarDetailsData(completion:@escaping (_ isSuccess: Bool)->()){
        guard let detailsUrlString = detailsUrlString else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getCarDetailsData(detailsUrlString: detailsUrlString) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let detailsResult = SCCarDetailsResult.yy_model(with: dict) else{
                completion(false)
                    return
            }
            let group = DispatchGroup()
            for res in detailsResult.Result ?? []{
                guard let imageUrlStrings = res.Overview?.Photos else{
                    continue
                }
                res.Overview?.carImages = [UIImage]()
                for urlString in imageUrlStrings{
                    group.enter()
                    SCNetworkManager.shared.getCarImage(imageUrlString: urlString, completion: { (image) in
                        if let image = image{
                            res.Overview?.carImages?.append(image)
                        }
                        group.leave()
                    })
                }
            }
            group.notify(queue: DispatchQueue.main, execute: {
                self.detailsResult = detailsResult
                completion(true)
            })
        }
    }
}
