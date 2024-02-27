//
//  ServiceProtocol.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import Foundation

protocol CarDetailDelegate: AnyObject {
    func didUpdateBrands()
    func didFailToUpdateBrands(withError error: Error)
}
