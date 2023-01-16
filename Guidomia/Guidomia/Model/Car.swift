//
//  Car.swift
//  Guidomia
//
//  Created by Pooja on 2023-01-15.
//

import Foundation

struct Car: Codable {
    let make: String
    let model: String
    let marketPrice: Float
    let customerPrice: Float
    let rating: Int
    let consList: [String]
    let prosList: [String]
    let image: String
}
