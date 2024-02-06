//
//  CarDetail.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import Foundation

struct CarDetail: Codable {
    
    let tipoVeiculo: Int
    let valor: String
    let marca: String
    let modelo: String
    let anoModelo: Int
    let combustivel: String
    let codigoFipe: String
    let mesReferencia: String
    let siglaCombustivel: String
}
