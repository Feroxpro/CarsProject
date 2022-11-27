//
//  CarModel.swift
//  introViewCode
//
//  Created by Felipe Domingos on 16/11/22.
//

import Foundation

typealias CarsModel = [CarModel]

struct CarModel: Codable {
    let id: Int?
    let nome: String?
    let tipo: String?
    let descricao: String?
    let urlFoto: String?
    let urlVideo: String?
    let latitude: String?
    let longitude: String?
}
