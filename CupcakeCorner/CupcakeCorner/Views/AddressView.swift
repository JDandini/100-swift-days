//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Javier Castañeda on 07/07/26.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.shippingAddress.name)
                TextField("Street Address", text: $order.shippingAddress.streetAddress)
                TextField("City", text: $order.shippingAddress.city)
                TextField("Zip", text: $order.shippingAddress.zip)
            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
                .disabled(!order.shippingAddress.isValidAddress)
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
