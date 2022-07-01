//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Ivan Pestov on 23.06.2022.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case.success(let appetizers):
//                    self.appetizers = appetizers
//
//                case .failure(let error):
//                    switch error {
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//
//                    }
//                }
//            }
//
//        }
//    } ... refactoring towards async iOS 15 ->
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading  = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem  = AlertContext.invalidResponse
                }
                isLoading  = false
            }
        }
    }
}
