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

    private enum CodingKeys: String, CodingKey {
        case tipoVeiculo = "TipoVeiculo"
        case valor = "Valor"
        case marca = "Marca"
        case modelo = "Modelo"
        case anoModelo = "AnoModelo"
        case combustivel = "Combustivel"
        case codigoFipe = "CodigoFipe"
        case mesReferencia = "MesReferencia"
        case siglaCombustivel = "SiglaCombustivel"
    }
}
