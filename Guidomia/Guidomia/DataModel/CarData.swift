//
//  Data.swift
//  Guidomia
//
//  Created by Pooja on 2023-01-16.
//

import Foundation
import RealmSwift

class CarData: Object {
    @objc dynamic var make:String = ""
    @objc dynamic var model:String = ""
    @objc dynamic var image:String = ""
    @objc dynamic var marketPrice:Float = 0.00
    @objc dynamic var customerPrice:Float = 0.00
    @objc dynamic var rating:Int = 0
    @objc dynamic var consList:String = ""
    @objc dynamic var prosList:String = ""
    
}
