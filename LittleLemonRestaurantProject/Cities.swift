//
//  Retaurants.swift
//  LittleLemonRestaurantProject
//
//  Created by Molindu Achintha on 2023-07-18.
//

import Foundation

class Cities: ObservableObject{
    @Published var cities:[Restaurant] = getCities()
    
    static func getCities() -> [Restaurant]{
        return [
            Restaurant(city: "Las Vagas", contact: "Downtown - (702) 555-9898"),
            Restaurant(city: "Los Angeles", contact: "North Hollywood - (213) 555-1413")
        ]
    }
}
