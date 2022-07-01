//
//  OrderView.swift
//  Appetizers
//
//  Created by Ivan Pestov on 22.06.2022.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed")
                    } label: {
                        APButton(title: {
                            "$\(order.totalPrice, specifier: "%.2f") - Place Order"
                            
                        }, {
                            print("tapped")
                        })
                    }
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order. \nPlease add an appetizer!")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offesets: IndexSet) {
        order.items.remove(atOffsets: offesets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
