//
//  StoreBuyView.swift
//  WordForLearn
//
//  Created by Nazmul on 25/6/21.
//


import SwiftUI
import StoreKit
//StoreBuyView
struct  StoreBuyView : View {
   // @Binding var isPresented: Bool
    @Binding var isPresented: Bool
  

    @StateObject var storeManager: StoreManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var privacypolicyPresent = false
    @State var transconditionPresent = false
    func getPriceFormatted(for product: SKProduct) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = product.priceLocale
        return formatter.string(from: product.price)
    }
    
    fileprivate func middium() -> some View {
        return VStack(alignment: .leading, spacing: 10) {
            HStack{
                Text("".capitalized)
                    .font(.system(size: 21, weight: .bold))
                    .foregroundColor( .white)
            }
        }
        
    }
    
    
    
    var body: some View {
        NavigationView {
            
      
            VStack(alignment: .leading ){
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.cardLinear)
                        .overlay(
                            Image("subscription")
                                .resizable()
                        )

                    VStack{
                        HStack{
                            Spacer()
                            refreshdButton(color: Color.black)
                            .padding(.trailing, 20)
                        .onTapGesture{
                            withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                               // isPresented = false
                           
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                        }

                        Spacer()
                        ZStack {


                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.cardLinear)
                                .frame(height: 120)

                            HStack{
                            VStack(alignment: .leading){
                                Text("label0".localizedStringForKey())
                                    .font(.system(size: 21, weight: .heavy))
                                    .foregroundColor(.green)
                                    //.padding(.bottom,1)

                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "checkmark.circle").foregroundColor( .green ).font(.headline)
                                        Text("label1".localizedStringForKey())
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor( .white )
                                    }
                                    HStack{
                                        Image(systemName: "checkmark.circle").foregroundColor( .green ).font(.headline)
                                    Text("label2".localizedStringForKey())
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor( .white )
                                    }
                                    HStack{
                                        Image(systemName: "checkmark.circle").foregroundColor( .green ).font(.headline)
                                    Text("label3".localizedStringForKey())
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor( .white )
                                    }

                                    HStack{
                                        Image(systemName: "checkmark.circle").foregroundColor( .green ).font(.headline)
                                    Text("label4".localizedStringForKey())
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor( .white )
                                    }
                                }


                            }
                                Spacer()
                            }.padding(.all,20)
                        }
                    }



                }
                
                List(storeManager.myProducts, id: \.self) { product in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(product.localizedTitle)
                                .font(.headline)
                            Text(product.localizedDescription)
                                .font(.caption2)
                        }
                        Spacer()
                        if UserDefaults.standard.bool(forKey: product.productIdentifier) {
                            Text ("label5".localizedStringForKey())
                                .foregroundColor(.green)
                        } else {
                            Button(action: {
                                //Purchase particular ILO product
                                storeManager.purchaseProduct(product: product)
                            }) {
                                Text("\(getPriceFormatted(for: product) ?? "")")
                            }.padding(.trailing,10)
                            .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.all,10)
                // .navigationTitle("Go Premium")
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            //Restore products already purchased
                            isPresented = false
                            storeManager.restoreProducts()
                        }) {
                            Text("button1".localizedStringForKey())
                        }
                    }
                })
                
                HStack{
                    Spacer()
                    Button("button1".localizedStringForKey()) {
                               print("Button pressed!")
                               storeManager.restoreProducts()
                           }

                           // .buttonStyle(GrowingButton())
                    .padding([.all],2).multilineTextAlignment(.center)
                    .foregroundColor( .black )
                    .font(.system(size: 19, weight: .semibold))

                    Spacer()
                }
               
                
                HStack{
                    Spacer()

                    Button(action: {
                        print("Button pressed!")
                        transconditionPresent = true
                    }, label:{

                            Text("button2".localizedStringForKey())
                                .fontWeight(.regular)
                                .foregroundColor(.blue)
                                .padding(.all,4)
                                .frame(maxWidth:.infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.blue,lineWidth: 1)
                                )
                    })

                    .fullScreenCover(isPresented: self.$transconditionPresent) {

                     TestWebView(word: "https://sites.google.com/view/revelstation/terms-and-conditions", incomePresented: $transconditionPresent)

                    }


                    Button(action: {
                        print("button3".localizedStringForKey())
                       privacypolicyPresent = true
                        
                    }, label:{

                            Text("button3".localizedStringForKey())
                                .fontWeight(.regular)
                                .foregroundColor(.blue)
                                .padding(.all,4)
                                .frame(maxWidth:.infinity)

                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.blue,lineWidth: 1)
                                )


                    })

                    .fullScreenCover(isPresented: self.$privacypolicyPresent) {

                     TestWebView(word: "https://sites.google.com/view/revelstation/privacy-policy", incomePresented: $privacypolicyPresent)

                    }
                    Spacer()
                }.padding([.leading,.trailing],20)
              
                
                
                Text("Payment will be charged to your iTunes account at confirmation of purchase.  Subscriptions will automatically renew unless auto-renew is turned off at least 24 hours before the end of current period. Your account will be charged according to your plan for renewal within 24 hours prior to the end of the current period. You can manage or turn off auto-renew in your Apple ID account settings at any time after purchase.").padding([.leading,.trailing],20).multilineTextAlignment(.center)
                    .foregroundColor( .darkBackground )
                    .font(.system(size: 11, weight: .light))
                    
                
                
            }.onLoad {
                print("onLoad")
            }
            
            .navigationViewStyle(StackNavigationViewStyle())
            
           
            
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct StoreBuyView_Previews: PreviewProvider {
    static var previews: some View {
        ParentPermisionView( isPresented: .constant(true), storeManager: StoreManager())
    }
}




struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


public struct refreshdButton: View {
    
    var imageName = "xmark"
    var color = Color.green
    public var body: some View {
        
        
        
 
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 44, height: 44)
                .rotationEffect(.degrees(39))
            
            Image(systemName: imageName)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white)
        }
    }
}




// lets add some color for background
extension Color {
    static let lightBackground = Color.init(red: 243/255, green: 243/255, blue: 243/255)
    static let darkBackground = Color.init(red: 34/255, green: 51/255, blue: 68/255)
}

extension Color {
    static let background   = Color.init(red: 1, green: 246/255, blue: 1)
    
    static let cardStart    = Color.init(red: 11/255, green: 19/255, blue: 2/255)
    static let cardEnd      = Color.init(red: 48/255, green: 53/255, blue: 27/255)
    
    static let cardLinear   = LinearGradient(
        gradient: Gradient(colors: [cardStart, cardEnd]),
        startPoint: .leading,
        endPoint: .trailing)
    
    static let logoLinear   = LinearGradient(
        gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.black]),
        startPoint: .bottomLeading,
        endPoint: .top)
}



struct ViewDidLoadModifier: ViewModifier {

    @State private var didLoad = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }

}


extension View {

    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }

}


struct SomeView: View {
    var body: some View {
        VStack {
            Text("HELLO!")
        }.onLoad {
            print("onLoad")
        }
    }
}
