//
//  BrandsViewModel.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 05/02/24.
//

import Foundation

class BrandsViewModel {

     func getCarBrand(completion: @escaping ([Car]?) -> Void) {
        let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas")!

        var request = URLRequest(url: url)

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let cars = try? JSONDecoder().decode([Car].self, from: data) {
                    completion(cars)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
}
