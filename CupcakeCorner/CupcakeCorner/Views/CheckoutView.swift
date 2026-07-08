//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Javier Castañeda on 07/07/26.
//

import SwiftUI

struct CheckoutView: View {
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var showingAlert = false

    var order: Order
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image
                            .resizable()
                            .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total is \(order.total, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }

    func placeOrder() async {
        let networking = Networking()
        let result = await networking.place(order: order)
        if case .failure(let error) = result {
            print(error)
            alertTitle = "Oh no!"
            alertMessage = "Something went wrong, please try again.\n\(error.localizedDescription)"
            showingAlert = true
        } else if case .success(let order) = result {
            print(order)
            alertTitle = "Thank you!"
            alertMessage = String(
                format: "Your order for %d %@ cupcakes is on its way!",
                order.quantity,
                order.flavor.displayName
            )
            showingAlert = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
