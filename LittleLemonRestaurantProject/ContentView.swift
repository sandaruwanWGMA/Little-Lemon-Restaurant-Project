//
//  ContentView.swift
//  LittleLemonRestaurantProject
//
//  Created by Molindu Achintha on 2023-07-18.
//

import SwiftUI

var cities = Cities()

struct ContentView: View {
    @StateObject var resevedRestaurants = ReservationsList()
    @StateObject var reservationNumber = ReservationNumber()

    var body: some View {
        VStack{
            TabView {
                Locations()
                    .tabItem{
                        Image(systemName: "fork.knife")
                        Text("Locations")
                    }
                Reservations()
                    .tabItem{
                        Image(systemName: "square.and.pencil")
                        Text("Reservations")
                    }
            }
            .environmentObject(resevedRestaurants)
            .environmentObject(reservationNumber)
            .environmentObject(cities)


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
