//
//  ViewController.swift
//  SQLiteExample
//
//  Created by Luis José Sánchez Carrasco on 23/10/17.
//  Copyright © 2017 Luis José Sánchez Carrasco. All rights reserved.
//


//  pod init
//  en pod file añadir->    
//               pod ‘SQLite.swift’
//  pod install 



// en general añadir 
// linked frameworks an libraries
//      Pods_nombreaplicacion.framework

import UIKit
import SQLite

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let db=DatabaseManagement.shared
        db.createTable()
        db.addRecord(inputId: 26, inputNombre: "bbererb")
        db.updateRecord(inputId: 24, newRegistro: Registro(id: 24,nombre: "modificado"))
        db.deleteRecord(inputId: 24)
        db.querryAllRecords()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

