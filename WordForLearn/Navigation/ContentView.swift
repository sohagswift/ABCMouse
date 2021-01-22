//
//  ContentView.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 20/1/21.
//

import SwiftUI

struct ContentView: View {
  
        @ViewBuilder
        var body: some View {
            #if os(iOS)
            Sidebar()
            #else
            Sidebar().frame(minWidth:800,minHeight:600)
            #endif
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.light)
//        ContentView()
//            .preferredColorScheme(.dark)
//        ContentView().previewLayout(.fixed(width: 200.0, height: 200.0))
        
    }
}
