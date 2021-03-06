//
//  CloseButton.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 24/1/21.
//

import SwiftUI

public struct CloseButton: View {
    
    public var body: some View {
        refreshdButton(color: Color.black)
            .padding([.trailing, .top], 20)
         
    }
}


public struct soundButton: View {
    
    public var body: some View {
        Image("sound")
//            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
    }
}




struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
