//
//  APIManager.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 07/02/24.
//

import Foundation

class APIManager {

    func performRequest<T: Codable>(endpoint: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: Environment.constants + endpoint) else {
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
        guard let url = URL(string: Environment.constants + endpoint) else {
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
    
    func getCarDetail(endpoint: String, completion: @escaping (CarDetail?) -> Void) {
        guard let url = URL(string: Environment.constants + endpoint) else {
            print("URL inválida: \(Environment.constants + endpoint)")
            completion(nil)
            return
        }
        print("Chamando API para \(Environment.constants + endpoint)")

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
            }

            if let error = error {
                print("Erro na chamada da API: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("Dados inválidos")
                completion(nil)
                return
            }

            do {
                let carDetail = try JSONDecoder().decode(CarDetail.self, from: data)
                print("Decodificado com sucesso: \(carDetail)")
                completion(carDetail)
            } catch {
                print("Erro na decodificação JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

class BrandsAPIManager: APIManager {
    func getBrands(completion: @escaping ([Car]?) -> Void) {
        performRequest(endpoint: "/marcas", completion: completion)
    }
}
