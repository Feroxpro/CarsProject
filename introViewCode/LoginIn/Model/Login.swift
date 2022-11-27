//
//  Login.swift
//  introViewCode
//
//  Created by Felipe Domingos on 16/11/22.
//

import Foundation


struct Login: Codable {

    let id: Int?
    let login: String?
    let nome: String?
    var email: String?
    let urlFoto: String?
    let token: String?
    let roles: [String]?
}
