//
//  UserModel.swift
//  Arquiteturas
//
//  Created by Nikolas Gianoglou Coelho on 18/09/2023.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
