//
//  ContentView.swift
//  LittleLemonRestaurantProject
//
//  Created by Molindu Achintha on 2023-07-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
