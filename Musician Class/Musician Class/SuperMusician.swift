//
//  File.swift
//  Musician Class
//
//  Created by Furkan Kaan Ugsuz on 29/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import Foundation

class SuperMusician : Musicians {
    
    func sing2() {
        print("enter night")
    }
    
    override func sing() {
        super.sing()
        print("exit light")
    }
    
}
