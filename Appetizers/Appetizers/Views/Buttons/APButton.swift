//
//  APButton.swift
//  Appetizers
//
//  Created by Ivan Pestov on 27.06.2022.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    private let action: () -> Void
    
    init(title: @escaping () -> LocalizedStringKey,_ action: @escaping () -> Void) {
        self.action   = action
        self.title    = title()
    }
    
    var body: some View {
        Button {
           action()
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 260, height: 50)
                .foregroundColor(.white)
                .background(Color.brandPrimary)
                .cornerRadius(10)
        }
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: {
            var title = ""
            title += "Test"
            title += " Title"
            return LocalizedStringKey(title)
        }, {})
    }
}
