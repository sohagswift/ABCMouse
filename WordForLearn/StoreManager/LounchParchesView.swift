//
//  LounchParchesView.swift
//  WordForLearn
//
//  Created by Nazmul on 25/6/21.
//

import SwiftUI
import StoreKit
//https://blckbirds.com/post/how-to-use-in-app-purchases-in-swiftui-apps/
//Test
struct LounchParchesView: View {
 
    @State private var isShowingDetails = false
    @StateObject var storeManager = StoreManager ()
    
    var body: some View {
        ZStack {
            ParentPermisionView(isForReview: .constant(false), isPresented: $isShowingDetails, storeManager: storeManager)
                .onAppear(perform: {
                    SKPaymentQueue.default().add(storeManager)
                    storeManager.getProducts()
                })
        }
    }
}

//Production
struct LounchAppView: View {
 
    
    @StateObject var storeManager = StoreManager ()
    
    var body: some View {
        ZStack {
            HomeView(storeManager: storeManager)
                .onAppear(perform: {
                    SKPaymentQueue.default().add(storeManager)
                    storeManager.getProducts()
                })
        }
    }
}

//struct LounchParchesView_Previews: PreviewProvider {
//    static var previews: some View {
//        LounchParchesView()
//    }
//}
