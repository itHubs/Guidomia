//
//  LocalDecoder.swift
//  Guidomia
//
//  Created by Pooja on 2023-01-15.
//

import Foundation
import SwiftUI
import RealmSwift

enum ErrorMessage: Error {
    case decodingError
}

class LocalDecoder {
    
    public func fetchCarDataFromJson(fileName: String, response:@escaping (Result<[Car]?,ErrorMessage>) -> Void) {
        var cars: [Car] = []

        //fetch Data from Realm

        do{
             let realm = try Realm()
            
            var carResult: Results<CarData>!
            
            carResult = realm.objects(CarData.self)
            
            var carList:[Car] = []
            var i = 0
            for carData in carResult {
                let carObj = Car(make: carData.make, model: carData.model, marketPrice: carData.marketPrice, customerPrice: carData.customerPrice, rating: carData.rating, consList: carData.consList.toJSON() as! [String], prosList: carData.prosList.toJSON() as! [String], image: carData.image)

                carList.insert(carObj, at: i)
                i+=1
                print(carObj)

            }
            cars = carList
            
            if (cars.count>0)
            {
                response(.success(carList))
            }


        }
        catch {
            print("Error decoding JSON data: \(error)")
            response(.failure(.decodingError))

        }

        if cars.count==0 {
            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    cars = try decoder.decode([Car].self, from: data)
                    
                    storeData(cars: cars)
                    
                    response(.success(cars))
                } catch {
                    print("Error decoding JSON data: \(error)")
                    response(.failure(.decodingError))
                }
            }
        }
        
    }
    
    // store Data To Realm
    func  storeData(cars:[Car]) {
        for car:Car in cars {
            let data = CarData()
            data.make = car.make
            data.model = car.model
            data.marketPrice = car.marketPrice
            data.customerPrice = car.customerPrice
            data.rating = car.rating
            data.image = car.image
            data.prosList = json(from: car.prosList as Any) ?? "[]"
            data.consList = json(from: car.consList as Any) ?? "[]"


            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(data)
                }
            }
            catch {
                print("Error : \(error)")
            }

        }
    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }

    
    

}

