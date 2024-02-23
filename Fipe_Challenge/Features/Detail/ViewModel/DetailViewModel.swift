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

    func getDetailForYears(completion: @escaping (CarDetail?) -> Void) {
        guard let brandId = brandId, let modelId = modelId, let yearId = yearId else {
            completion(nil)
            return
        }
        let endpoint = "/marcas/\(brandId)/modelos/\(modelId)/anos/\(yearId)"

        api.getCarDetail(endpoint: endpoint) { details in
            print("Dados da API: \(details)")
            completion(details)
        }
    }
}
