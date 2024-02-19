//
//  DetailViewModel.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 19/02/24.
//

import Foundation

class DetailViewModel {
    var api = APIManager()
    var brandId: String?
    var modelId: String?
    var yearId: String?

    func getDetailForYears(completion: @escaping ([CarDetail]?) -> Void) {
        guard let brandId = brandId, let modelId = modelId, let yearId = yearId else { return }

        api.getCarDetail(brandId: brandId, modelId: modelId, yearId: yearId) { detail in
            completion(detail)
        }
    }
}
