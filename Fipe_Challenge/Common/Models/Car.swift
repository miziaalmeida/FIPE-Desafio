//
//  Car.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import Foundation

struct Car: Codable {
    let nome: String
    let codigo: String
}

struct CarModel: Codable {
    let modelos: [ModelDetail]
}

//struct Anos: Codable {
//    let codigo: String
//    let nome: String
//}

struct ModelDetail: Codable {
    let codigo: Int
    let nome: String
}
