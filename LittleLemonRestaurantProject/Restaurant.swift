//
//  Restaurant.swift
//  LittleLemonRestaurantProject
//
//  Created by Molindu Achintha on 2023-07-18.
//

import Foundation

class Restaurant: Identifiable, ObservableObject{
    var id = UUID()
    var city: String
    var contact: String
    @Published var number = 1
    
    init(city: String, contact: String) {
        self.city = city
        self.contact = contact
    }
}
