//
//  CarListViewModel.swift
//  Guidomia
//
//  Created by Pooja on 2023-01-15.
//

import Foundation

struct CarViewModel {
    
    let car: Car
    
    var image: String {
        car.image
    }
    
    var title: String {
        car.make
    }
    
    var subTitle: String {
        "Price : \(car.customerPrice)"
    }

    var rating: Decimal {
        Decimal(car.rating)
    }

    var pros: [String] {
        car.prosList
    }
    
    var cons: [String] {
        car.consList
    }
    
}
