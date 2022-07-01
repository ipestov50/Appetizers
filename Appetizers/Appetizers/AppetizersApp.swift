//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Ivan Pestov on 22.06.2022.
//

import SwiftUI

@main // entry point to program
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
