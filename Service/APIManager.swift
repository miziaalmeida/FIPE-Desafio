//
//  APIManager.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 07/02/24.
//

import Foundation

class APIManager {
    let baseURL = "https://parallelum.com.br/fipe/api/v1/carros"
    
    func performRequest<T: Codable>(endpoint: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
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
    
    func getCarModels(endpoint: String, completion: @escaping (CarModel?) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            print("URL inválida")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                let carModel = try? JSONDecoder().decode(CarModel.self, from: data)
                completion(carModel)
            } catch {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    func getCarYears(brandId: String, modelId: String, completion: @escaping ([Anos]?) -> Void) {
            let endpoint = "/marcas/\(brandId)/modelos/\(modelId)/anos"

            performRequest(endpoint: endpoint) { (years: [Anos]?) in
                completion(years)
            }
        }
    
    func getCarDetail(brandId: String, modelId: String, yearId: String, completion: @escaping ([CarDetail]?) -> Void) {
            let endpoint = "/marcas/\(brandId)/modelos/\(modelId)/anos/\(yearId)"

            performRequest(endpoint: endpoint) { (details: [CarDetail]?) in
                completion(details)
            }
        }
}

class BrandsAPIManager: APIManager {
    func getBrands(completion: @escaping ([Car]?) -> Void) {
        performRequest(endpoint: "/marcas", completion: completion)
    }
}
