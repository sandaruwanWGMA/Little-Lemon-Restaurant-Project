//
//  Reservations.swift
//  LittleLemonRestaurantProject
//
//  Created by Molindu Achintha on 2023-07-18.
//

import SwiftUI

struct Reservations: View {
    @EnvironmentObject var resevedRestaurants: ReservationsList
    var body: some View {
        List{
            Section(header: Text("Reserved Restaurants").font(.largeTitle))
            {
                ForEach(resevedRestaurants.reservationsList, id: \.id){ reservation in
                    VStack(alignment: .leading){
                        Text(reservation.city)
                            .font(.title)
                        Text(reservation.contact)
                            .foregroundColor(Color.gray)
                    }
            }
                
            }
        }
    }
}


struct Reservations_Previews: PreviewProvider {
    static var previews: some View {
        Reservations().environmentObject(ReservationsList())
    }
}
