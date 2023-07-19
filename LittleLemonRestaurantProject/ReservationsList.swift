//
//  ReservationsList.swift
//  LittleLemonRestaurantProject
//
//  Created by Molindu Achintha on 2023-07-19.
//

import Foundation

class ReservationsList: ObservableObject, Identifiable{
    var id = UUID()
    @Published var reservationsList: [Restaurant] = []
    init(id: UUID = UUID()) {
        self.id = id
    }
    
}
