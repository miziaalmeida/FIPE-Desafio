//
//  YearViewModel.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 19/02/24.
//

import Foundation

class YearsViewModel {
    var api = APIManager()
    var brandId: String?
    var modelId: String?

    
    func getYearsForModel(completion: @escaping ([Anos]?) -> Void) {
        guard let brandId = brandId, let modelId = modelId else { return }
        let endpoint = "/marcas/\(brandId)/modelos/\(modelId)"
        
        api.getCarYears(brandId: brandId, modelId: modelId) { years in
            completion(years)
        }
    }

}
