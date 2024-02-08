//
//  BrandsViewModel.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 05/02/24.
//

import Foundation

class BrandsViewModel {
    var api = BrandsAPIManager()

    func getBrands(completion: @escaping ([Car]?) -> Void) {
        api.getBrands(completion: completion)
    }
}
