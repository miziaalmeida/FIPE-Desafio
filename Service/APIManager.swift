//
//  APIManager.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 07/02/24.
//

import Foundation

class APIManager {
    let baseURL = "https://parallelum.com.br/fipe/api/v1/carros"

    func performRequest<T: Decodable>(endpoint: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            print("URL inválida")
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData)
                } catch {
                    print("Erro na decodificação JSON: \(error)")
                    completion(nil)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}

class BrandsAPIManager: APIManager {
    func getBrands(completion: @escaping ([Car]?) -> Void) {
        performRequest(endpoint: "/marcas", completion: completion)
    }
}

class ModelsAPIManager: APIManager {
    func getModelsForBrand(brandId: String, completion: @escaping ([CarDetail]?) -> Void) {
        let endpoint = "/marcas/\(brandId)/modelos"
        performRequest(endpoint: endpoint, completion: completion)
    }
}
