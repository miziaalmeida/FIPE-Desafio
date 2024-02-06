//
//  ServiceProtocol.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import Foundation

protocol CarDetailDelegate: AnyObject {
    func didObtainCarDetail(_ detalhes: [CarDetail])
    func didFailCarDetail(_ erro: Error)
}
