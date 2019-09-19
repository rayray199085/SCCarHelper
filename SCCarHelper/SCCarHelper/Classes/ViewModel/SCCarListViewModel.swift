//
//  SCCarViewModel.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import Foundation

class SCCarListViewModel{
    var carDataViewModels: [SCCarViewModel]?
    var detailsUrlString: String?
    var carDetailsViewModels: [SCCarDetailsViewModel]?
    
    // get basic car information
    func loadCarData(completion:@escaping (_ isSuccess: Bool)->()){
        SCNetworkManager.shared.getCarData { (data, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let data = data,
                let carResult = try? JSONDecoder().decode(SCCarResult.self, from: data) else{
                    completion(false)
                    return
            }
            var carDataViewModels = [SCCarViewModel]()
            for carData in carResult.Result ?? []{
                carDataViewModels.append(SCCarViewModel(carData: carData))
            }
            self.carDataViewModels = carDataViewModels
            completion(true)
        }
    }
    
    func loadCarDetailsData(completion:@escaping (_ isSuccess: Bool)->()){
        guard let detailsUrlString = detailsUrlString else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getCarDetailsData(detailsUrlString: detailsUrlString) { (data, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let data = data,
                  let detailsResult = try? JSONDecoder().decode(SCCarDetailsResult.self, from: data) else{
                completion(false)
                    return
            }
            var carDetailsViewModels = [SCCarDetailsViewModel]()
            for detailsModel in detailsResult.Result ?? []{
                carDetailsViewModels.append(SCCarDetailsViewModel(carDetailsData: detailsModel))
            }
            self.carDetailsViewModels = carDetailsViewModels
            completion(true)
        }
    }
}
