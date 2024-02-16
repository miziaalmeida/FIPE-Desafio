//
//  ModelsViewModel.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 07/02/24.
//

import Foundation

class ModelsViewModel {
    var api = APIManager()
    var brandId: String?
    
    func getModelsForBrand(completion: @escaping (CarModel) -> Void) {
        guard let brandId = brandId else { return }
        let endpoint = "/marcas/\(brandId)/modelos"
        
        api.getCarModels(endpoint: endpoint) { model in
            if let cars = model {
                completion(cars)
            }
        }
    }
}
