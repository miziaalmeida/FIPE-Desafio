//
//  APIManager.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import Foundation

class APIManager {
    
    weak var delegate: CarDetailDelegate?
    
    func getCar() {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/") else {
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }

            if let error = error {
                self.delegate?.didFailCarDetail(error)
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let carDetails = try decoder.decode([CarDetail].self, from: data)
                    self.delegate?.didObtainCarDetail(carDetails)
                } catch {
                    self.delegate?.didFailCarDetail(error)
                }
            }
        }
        task.resume()
    }
}
