//
//  LocalDecoder.swift
//  Guidomia
//
//  Created by Pooja on 2023-01-15.
//

import Foundation

enum ErrorMessage: Error {
    case decodingError
}

class LocalDecoder {
    
    public func fetchCarDataFromJson(fileName: String, response:@escaping (Result<[Car]?,ErrorMessage>) -> Void) {
        var cars: [Car] = []

        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                cars = try decoder.decode([Car].self, from: data)
                response(.success(cars))
            } catch {
                print("Error decoding JSON data: \(error)")
                response(.failure(.decodingError))
            }
        }
    }

}

