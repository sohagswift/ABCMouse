//
//  AlertHelper.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 13/9/21.
//

import Foundation

//
//  AlertItem.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 26/8/21.
//

import SwiftUI



struct AlertItem:Identifiable {
    let id = UUID()
    var alertIdnetiy : AlertPoint = .adoptNew
    var title : Text
    var message : Text
    var buttonText : Text
}

/*
 
 //        .alert(isPresented: $showingAlertNotFoundAds, content: {
 //
 //            Alert(title: Text("Notice"), message: Text("please wait 10 second do not close the app.\n try again after 10 second to watch a ads. upgrade premium avoid this kind disturbing. we need some money to survive better game play"),
 //                primaryButton: .default (Text("Yes. I want upgrade")) {
 //                  print("Yes")
 //                    premiumPresent = true
 //
 //                },
 //                secondaryButton: .cancel()
 //            )
 //        })
 */
struct AlertContext{
    static let noAdsFound = AlertItem(alertIdnetiy:.noAdsFound,title: Text("Notice"), message: Text("please wait 10 second do not close the app.\n try again after 10 second to watch a ads. upgrade premium avoid this kind disturbing. we need some money to survive better game play"), buttonText: Text("Yes. I want to upgrade"))
    
}



enum AlertPoint {
    case adoptNew
    case noAdsFound
    case east
    case west
}
