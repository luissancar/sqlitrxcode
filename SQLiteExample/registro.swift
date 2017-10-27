//
//  registro.swift
//  SQLiteExample
//
//  Created by Luis José Sánchez Carrasco on 27/10/17.
//  Copyright © 2017 Luis José Sánchez Carrasco. All rights reserved.
//

import Foundation


class Registro: CustomStringConvertible {
    let id: Int64?
    let nombre: String
    
    init(id: Int64, nombre: String) {
        self.id = id
        self.nombre = nombre
    }
    var description: String {
        return "id = \(self.id), nombre = \(self.nombre)"
    }
}
