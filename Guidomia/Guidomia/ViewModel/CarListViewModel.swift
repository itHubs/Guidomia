//
//  CarViewModel.swift
//  CarList
//
//  Created by Pooja on 2023-01-15.
//

import Foundation

class CarListViewModel: ObservableObject {

    @Published var cars = [CarViewModel]()
    @Published var filterCars = [CarViewModel]()
    @Published var models = [String]()
    @Published var makes = [String]()

    let loalDecoder = LocalDecoder()
    

    func decodeCarList() {
        loalDecoder.fetchCarDataFromJson(fileName: "car_list") { result in
            switch result {
            case .success(let cars):

                if let cars = cars {
                    DispatchQueue.main.async {
                        
                        var makeList:[String] = []

                        for car in cars {
                            makeList.insert(car.make, at: 0)
                        }
                        
                        self.makes = makeList

                        var modelList:[String] = []

                        for car in cars {
                            modelList.insert(car.model, at: 0)
                        }
                        
                        self.models = modelList


                        self.cars = cars.map(CarViewModel.init)
                        
                        self.filterCars = self.cars
                                                
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    

}


struct CarViewModel: Identifiable {
    
    let id = UUID().uuidString
    let car: Car
    var isExpanded: Bool = false // moved state variable to the model

    init(car: Car) {
        self.car = car
    }

    
    var image: String {
        car.image
    }
    
    var make: String {
        car.make
    }
    
    var model: String {
        car.model
    }

    var title: String {
        car.make
    }
    
    var subTitle: String {
        "Price : \(Int(car.customerPrice).roundedWithAbbreviations)"
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
