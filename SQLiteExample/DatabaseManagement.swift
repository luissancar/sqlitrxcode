//
//  DatabaseManagement.swift
//  SQLiteExample
//
//  Created by Luis José Sánchez Carrasco on 23/10/17.
//  Copyright © 2017 Luis José Sánchez Carrasco. All rights reserved.
//

import Foundation
import SQLite
class DatabaseManagement {
    static let shared:DatabaseManagement = DatabaseManagement()
    private let db: Connection?
    
    private let tabla01 = Table("tabla01")
    private let id = Expression<Int64>("id")
    private let nombre = Expression<String>("nombre")
    init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            db = try Connection("\(path)/ishop.sqlite3")
            print("ok")
        } catch {
            db = nil
            print("error abriendo bd")
        }
    }
    
    
    
    func createTable() {
        do {
            try db!.run(tabla01.create( ifNotExists: true) { table in
                table.column(id)
                table.column(nombre)
                print("tabla creada")

                })
            }
            catch {
                print("Error creando tabla")
            }
        
    }
    
    func addRecord(inputId: Int64, inputNombre: String) -> Int64? {
        do {
            let insert = tabla01.insert(id <- inputId, nombre <- inputNombre)
            let  ins = try db!.run(insert)
            print("inserción correcta")
            return ins
        }  catch {
            print("error insertando")
            return nil
        }
    }
    
    func querryAllRecords() -> [Registro] {
        var registros = [Registro]()
        do {
            for record in try db!.prepare(self.tabla01) {
                let newRecord = Registro(id: record[id], nombre: record[nombre])
                registros.append(newRecord)
            }
        } catch {
            print("error leer lista")
        }
        for regi in registros {
            print(regi)
        }
        return registros
    }
    
    func updateRecord(inputId: Int64, newRegistro: Registro) -> Bool {
        let tblFilter = tabla01.filter(id == inputId)
        do {
            let update = tblFilter.update([
                nombre <- newRegistro.nombre
                ])
            if try db!.run(update) > 0 {
                print ("actualizado")
                return true
            }
        } catch {
            print("error update")
        }
        return false
    }
    
    func deleteRecord(inputId: Int64) -> Bool {
        do {
            let reg = tabla01.filter(id == inputId)
            try db!.run(reg.delete())
            print ("borrado correcto")
            return true
        } catch {
            print("error delete")
        }
        return false
    }
    
}


















