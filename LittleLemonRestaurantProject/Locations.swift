//
//  Locations.swift
//  LittleLemonRestaurantProject
//
//  Created by Molindu Achintha on 2023-07-18.
//

import SwiftUI

struct Locations: View {
    @EnvironmentObject var citiesList: Cities
//    @State private var selectedRestaurant: Restaurant? = nil

    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .center){
                    Image("LittleLemons")
                        .resizable()
                        .frame(width: 90, height: 90)
                    Text("Little Lemon")
                        .font(.system(size: 40))
                        .bold()
                }
                Text("Select a location")
                    .font(.system(size: 22))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color(UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1)))
                    .cornerRadius(30)
                List{
                    ForEach(citiesList.cities){ restaurant in
                        NavigationLink(destination: ReservationDetails(restaurant:restaurant)){
                            VStack(alignment: .leading){
                                Text(restaurant.city)
                                    .font(.title)
                                Text(restaurant.contact)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                }
            }
        }
    }

}

struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations()
    }
}
