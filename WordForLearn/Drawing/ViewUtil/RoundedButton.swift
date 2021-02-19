//
//  RoundedButton.swift
//  WordForLearn
//
//  Created by Nazmul on 19/2/21.
//

import SwiftUI

struct RoundedButton : View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Save")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                Spacer()
            }
        }
        .padding(.vertical, 10.0)
        .background(Color.red)
        .padding(.horizontal, 50)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton()
    }
}
