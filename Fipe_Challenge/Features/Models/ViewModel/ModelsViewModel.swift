//
//  ModelsViewModel.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 07/02/24.
//

import Foundation

class ModelsViewModel {
    var api = ModelsAPIManager()
    var brandId: String?

    func getModelsForBrand(completion: @escaping ([CarDetail]?) -> Void) {
        guard let brandId = brandId else {
            print("ID indefinido")
            completion(nil)
            return
        }
        api.getModelsForBrand(brandId: brandId, completion: completion)
    }
}
