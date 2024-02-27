//
//  APIManager.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 07/02/24.
//

import Foundation

class APIManager {
    
    func getCarDetail(brandId: String, modelId: String, yearId: String, completion: @escaping (CarDetail?) -> Void) {
        let endpoint = "\(Environment.baseUrl)/\(brandId)/modelos/\(modelId)/anos/\(yearId)"
        performRequest(endpoint: endpoint, completion: completion)
    }
    
    func getCarYears(brandId: String, modelId: String, completion: @escaping ([Anos]?) -> Void) {
        let endpoint = "\(Environment.baseUrl)/\(brandId)/modelos/\(modelId)/anos"

        performRequest(endpoint: endpoint) { (years: [Anos]?) in
            completion(years)
        }
    }
    
    func getCarModels(brandId: String?, completion: @escaping (CarModel?) -> Void) {
        guard let brandId = brandId else { return }
        let endpoint = "\(Environment.baseUrl)/\(brandId)/modelos"
        performRequest(endpoint: endpoint, completion: completion)
    }
    
    func getBrands(completion: @escaping ([Car]?) -> Void) {
        performRequest(completion: completion)
    }

    func performRequest<T: Codable>(endpoint: String? = Environment.baseUrl, completion: @escaping (T?) -> Void) {
        guard let endpoint = endpoint else {
            return
        }
        
        guard let url = URL(string: endpoint) else {
            print("URL inválida")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
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
                print(error)
                completion(nil)
            }
        }
        task.resume()
    }
}
