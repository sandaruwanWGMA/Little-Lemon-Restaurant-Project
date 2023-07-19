import SwiftUI

struct ReservationDetails: View {
    @State var email = ""
    @State private var phoneNumber = ""
    @State private var name = ""
    @State private var messege = ""
    @State private var errorMessage: ErrorModel? = nil
    @ObservedObject var restaurant: Restaurant
    @EnvironmentObject var reservationNumber: ReservationNumber
    @EnvironmentObject var sharedObj: ReservationsList
    @Environment(\.presentationMode) var presentationMode

    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        let currentDate = Date()
        List {
            VStack(alignment: .leading){
                Text(restaurant.city)
                    .font(.title)
                Text(restaurant.contact)
                    .foregroundColor(Color.gray)
            }
            HStack(spacing: 80){
                VStack(alignment: .leading){
                    Text("PARTY")
                    Text(String(restaurant.number))
                }
                HStack{
                    Text(dateFormatter.string(from: currentDate))
                        .padding(10)
                        .background(Color(UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1)))
                        .cornerRadius(10)
                    Text(timeFormatter.string(from: currentDate))
                        .padding(10)
                        .background(Color(UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1)))
                        .cornerRadius(10)

                }
            }
            HStack{
                Text("NAME: ")
                TextField("Your Name...", text: $name)
            }
            HStack{
                Text("PHONE: ")
                TextField("Phone Number...", text: $phoneNumber)
            }
            HStack{
                Text("E-MAIL: ")
                TextField("Your e-mail...", text: $email)
            }
            TextField("add any special request (Optional)", text: $messege)
                .onSubmit {
                    print(messege)
                }
                .padding(.horizontal, 20)
                .padding(.vertical)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1)), lineWidth: 1)
                )
            Button("Confirm Reservation"){
                print("Tapped")
                print(reservationNumber)
                if validateInput() != false{
                    reservationNumber.number += 1
                    restaurant.number += 1
                    
                    sharedObj.reservationsList.append(restaurant)
                    Reservations()
                        .environmentObject(sharedObj)
                    presentationMode.wrappedValue.dismiss()

                }
            }
                .textCase(.uppercase)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .alert(item: $errorMessage) { error in
                                    Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
                                }


        }
    }
    
    func validateInput() -> Bool {
        if name.isEmpty || phoneNumber.isEmpty || email.isEmpty || name.count < 3 {
            errorMessage = ErrorModel(message: """
            Found these errors in the form
            
            Names can only contain letters and
            must have at least 3 characters
            
            The phone number can not be blank
            
            The e-mail is invalid and
            can not be blank
            """)
            return false
        } else {
            errorMessage = nil
            return true
        }
    }
}

struct ReservationDetails_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetails(restaurant: Restaurant(city: "", contact:"")).environmentObject(ReservationsList())
    }
}

struct ErrorModel: Identifiable {
    let id = UUID()
    let message: String
}
