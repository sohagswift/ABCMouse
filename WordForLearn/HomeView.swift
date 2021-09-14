//
//  ContentView.swift
//  MoviesParallaxDemo
//
//  Created by Brian Voong on 1/9/21.
//

import SwiftUI
import StoreKit
import GoogleMobileAds


extension UIView {
    var globalFrame: CGRect? {
        let rootView = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view
        return self.superview?.convert(self.frame, to: rootView)
    }
}

struct Movie: Hashable {
    let title, imageName: String
}

struct HomeView: View {
    
    @State private var showingActionSheet = false
    var rewardAd = Rewarded()
    @State private var alertItem : AlertItem?
    
    
    
    @StateObject var storeManager: StoreManager
    @State var openInAppParcace = false
    @State var openLanguage = false
    @State var isForReview  = false
    @State private var outgoingCardPresent = false
    
    @ObservedObject var title = ListViewModel()
    
    // If you are getting the "can only present once" issue, add this here.
     // Fixes the problem, but not sure why; feel free to edit/explain below.
 //    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @Environment(\.presentationMode) var presentationMode

    
//    func rateApp() {
//
//
//        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
//                  SKStoreReviewController.requestReview(in: scene)
//              }
//    }
    
//    init() {
//        UINavigationBar.appearance().barTintColor = .systemBackground
//    }
    
    
    //2,3,10,11,12 =  8-12
    //4-9 = 2-7
    
    
    let topMovies: [Movie] = [//learing
        .init(title: "Level 1", imageName: "life1"),
        .init(title: "Art", imageName: "drawing"),
   

       // .init(title: "Level 4", imageName: "life5"),
       // .init(title: "Level 5", imageName: "life6"),
       // .init(title: "Level 6", imageName: "life6"),
    ]
  
    let animationMovies: [Movie] = [
        .init(title: "Level 2", imageName: "backtotheschool"),
        .init(title: "Level 3", imageName: "traceabc"),
        .init(title: "Level 4", imageName: "tracenumber"),
        //.init(title: "Art", imageName: "drawing"),
        //.init(title: "Level 8", imageName: "life6"),
        //.init(title: "Level 10", imageName: "life2")
    ]
    
    
    let dramaMovies: [Movie] = [
        .init(title: "Level 5", imageName: "LearnNumber"),
        .init(title: "Level 6", imageName: "colorletter"),
        .init(title: "Level 7", imageName: "learnColor"),
        //.init(title: "Art", imageName: "drawing"),
        //.init(title: "Level 12", imageName: "life6"),
        //.init(title: "Level 10", imageName: "life2")
    ]
    
    let sincMovies: [Movie] = [
        .init(title: "Level 8", imageName: "findit"),
        .init(title: "Level 9", imageName: "learnObject"),
        .init(title: "Level 10", imageName: "whichone"),
        .init(title: "Level 11", imageName: "startwith"),
        .init(title: "Level 12", imageName: "missingletter"),
        //.init(title: "Art", imageName: "drawing"),
        //.init(title: "Level 12", imageName: "life6"),
        //.init(title: "Level 10", imageName: "life2")
    ]
    
    
    
    @ViewBuilder
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                
                VStack{
                    HStack{
                        VStack{
                            Text("KidS_WOrLd".localizedStringForKey()).font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(.white))
                                .actionSheet(isPresented: $showingActionSheet) {
                                    ActionSheet(title: Text("Premiume Access"), message: Text("Upgrade premium or Watch a Reward video to access premium items"), buttons: [
                                        
                                        .default(Text("Watch Video Ads")) {
                                  
                                            isForReview.toggle()
                                            
                                        },
                                        .default(Text("Upgrade Premium")) {
                                            openInAppParcace = true

                                        },
                                        .cancel()
                                    ])
                                }
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                        }.background(Image("Certificate3")
                                        .resizable()
                                        .scaledToFill())
                        Spacer()
                        refreshdButton(imageName: "lock.shield")
                        .padding([.trailing,.top], 10)

                        .onTapGesture{
                            openInAppParcace.toggle()
                        }
                        
                        
                        refreshdButton(imageName: "flag")
                        .padding([.trailing,.top], 10)
                        .onTapGesture{
                            
//                            if TStorage.VarifyParent {
                                
                                openLanguage.toggle()
//                            }else{
//                                TStorage.AcccessParent.toggle()
//                                openInAppParcace.toggle()
//                            }
//
                            
                            
                        }
                        
//                        refreshdButton(imageName: "app")
//                        .padding([.trailing,.top], 10)
//                        .onTapGesture{
//
////                            if TStorage.VarifyParent {
//
//                            isForReview.toggle()
////                            }else{
////                                TStorage.AcccessParent.toggle()
////                                openInAppParcace.toggle()
////                            }
////
//
//
//                        }
                        
                      
                    }
                }
                
                          
              
                  
                    ScrollView {
                        
                 
                      //  Divider().padding(.leading, 16)
                    

                        
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 5), count: 2),spacing:5, content: {
                                ForEach(topMovies + animationMovies + dramaMovies + sincMovies, id: \.self) { num in
                //                    GeometryReader { proxy in
                //                        let scale = getScale(proxy: proxy)
                //                        NavigationLink(
                //                            destination: getDestination(itemText: num.title) /*MovieDetailsView(movie: num)*/.navigationBarHidden(true), isActive: $outgoingCardPresent,
                //                            label: {
                                                VStack(spacing: 8) {
                                                    Image(num.imageName)
                                                        .resizable()
                                                        .scaledToFill()
                //                                        .frame(width:)
                                                        .clipped()
                                                        .cornerRadius(8)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(white: 0.4))
                                                        )
                                                        .shadow(radius: 3)
                                                    Text(num.title.components(separatedBy: " ")[0].localizedStringForKey() + " \(num.title.components(separatedBy: " ").last ?? "1")")
                                                        .font(.system(size: 16, weight: .semibold))
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(.black)
                                                }.onTapGesture {
                //
                //                                            if !storeManager.isPurchase() {
                //                                               // outgoingCardPresent.toggle()
                //                                                title.addItem(content:  "purchase_require")
                //                                            }else{
                                                    
//                                                    if TStorage.VarifyParent {
//
//
//                                                                              }else{
                                                    
                                                    title.addItem(content:  num.title)
                                                    guard storeManager.isPurchase() else{
                                                       showingActionSheet = true
                                                        return
                                                    }
                                                  
                                                    

                                                                              
//                                                                                return
//                                                                              }
                                                    
                                                               
                                                           // }
                                                    
                                                   
//                                                    outgoingCardPresent.toggle()
                                                }
                //                            })
                                        
                //                            .scaleEffect(.init(width: scale, height: scale))
                //                           .animation(.spring(), value: 1)
                //                            .animation(.easeOut(duration: 1))
                                            
                //                            .padding(.vertical)
                                    }
                //                    .frame(width: 125, height: 380)
                //                    .padding(.horizontal, 32)
                //                    .padding(.vertical, 32)
                                .padding([.horizontal], 15)
                                    
                                  
                                  
                             //   }
                                })
                                Spacer()
                                    .frame(width: 16)
                                

                            }
                                            .fullScreenCover(isPresented: self.$outgoingCardPresent) {
                                                getDestination(itemText: title.title)
                            
                                            }
                          
                        }
                        
                     
                        
                    }
            }.background(Image("HomeBackground")
                            .resizable()
                            .scaledToFill())
            .fullScreenCover(isPresented: self.$openInAppParcace) {
             
                ParentPermisionView( isPresented: $openInAppParcace,storeManager: storeManager)

            }
            
            .onReceive(NotificationCenter.default.publisher(for: NSNotification.ImageClick))
                  { obj in
                     // Change key as per your "userInfo"
                      if let userInfo = obj.userInfo, let info = userInfo["info"] {
                        print(info)
                       
                        outgoingCardPresent = true
                     }
                  }
            .alert(item: $alertItem, content: { alertItemOk in
                
                Alert(title: alertItemOk.title, message: alertItemOk.message, primaryButton: .default(alertItemOk.buttonText, action:{
                    
                    
                  if alertItemOk.alertIdnetiy == .noAdsFound{
                         openInAppParcace = true
                    }
                    

                    
                }), secondaryButton: .cancel()
                
                
              
                )
                
                
            })
            .onReceive(NotificationCenter.default.publisher(for: NSNotification.PrentClick))
                  { obj in
                     // Change key as per your "userInfo"
                
              
                      if let userInfo = obj.userInfo, let info = userInfo["info"] {
                        print(info)
                       
                     
                        
                        
                        
                        if storeManager.isPurchase() {
                            outgoingCardPresent = true
                        }else{
                            
                          
                      
                            self.rewardAd.showAd(rewardFunction: { status in
                                      print("Give Reward \(status)")
                                if status < 10 {
                                
                                    alertItem = AlertContext.noAdsFound
                                }
                              
                              
                                    })
                        }
                        
                        
                        
                     }
                  }
            
            .fullScreenCover(isPresented: self.$isForReview) {
             
                ParentPermisionView2( isPresented: $isForReview,storeManager: storeManager)

            }
            
            .fullScreenCover(isPresented: self.$openLanguage) {
             
                LanguageModalView(isPresented: $openInAppParcace)

            }
            
           
            
            .navigationBarHidden(true)
            .navigationBarTitle("") //this must be empty
            .navigationBarBackButtonHidden(true)
            
        }.navigationViewStyle(StackNavigationViewStyle())
       
        
       // .edgesIgnoringSafeArea(.all)
        
      
 
        
            
        
    }
    
    func getDestination(itemText: String) -> AnyView {
        
//
    
//
        
        
      
//        if movies[0].title == itemText {
//                return AnyView(CategoryViewPicturePlay())
//
//            }else{
//                return AnyView(CategoryViewPicturePlay())
//            }
        //
        
        // var mainItem = ["Picture Game","Word Game","Find Game","Letter Game"]
        
        //2,3,10,11,12 =  8-12
        switch itemText.lowercased() {
        case "Level 12".lowercased(): //Find the missing la tter _pple
            return AnyView(CategoryViewPicturePlay(Viewindex:4,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 11".lowercased(): //start with the letter
            return AnyView(CategoryViewPicturePlay(Viewindex:0,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 10".lowercased(): //which on is ______
            return AnyView(CategoryViewPicturePlay(Viewindex:2,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 9".lowercased()://which one is word
            return AnyView(CategoryViewPicturePlay(Viewindex:1,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 8".lowercased(): //find it
            return AnyView(CategoryViewPicturePlay(Viewindex:3,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        default:
            //return AnyView(TryColorView(items: WordData.tryColor))
//
//            if "Level 1".lowercased() == itemText.lowercased() {
//                 return AnyView(PlayWordView())
//            }
            
//            if !storeManager.isPurchase(){
//               // outgoingCardPresent.toggle()
//                return AnyView(ParentPermisionView( isPresented: $outgoingCardPresent,storeManager: storeManager))
//            }
        

            
            
            //4-9 = 2-7
           
            switch itemText.lowercased() {
            case "Level 7".lowercased(): // learn color
                return AnyView(LearnColorView(items: WordData.colors))
            case "Level 6".lowercased():  //color it charater
                return AnyView(TryColorView(items: WordData.getTrytoWirte(color:true)))
            case "Level 5".lowercased():  //learn number
                return AnyView(LearnNumberView(items: WordData.numberWithTextBottom))
            case "Level 4".lowercased(): //traching number
                return AnyView(TryWriteView(items: WordData.typeWordNumbers))
            case "Level 3".lowercased(): //traching latter
                return AnyView(TryWriteView(items: WordData.getTrytoWirte()))
            case "Level 2".lowercased(): //number  / charater  learing
                return AnyView(latterToWordView(fromHome: $outgoingCardPresent))
            case "Level 1".lowercased():
                return AnyView(PlayWordView())
            default:
                return AnyView(TryColorView(items: WordData.tryColor))
            }
        }
        
      }

        

    
        
}

class ListViewModel: ObservableObject {

   @Published var title = String()
    
    @Published var isPrensetParent = Bool()

   func addItem(content : String){
    title = content
   }
    
    
}




//struct MoviesCarousel: View {
//
//    @StateObject var storeManager: StoreManager
//    @State private var outgoingCardPresent = false
//
//    @State private var isForReview = true
//
//       var categoryName : String = ""
//    @ObservedObject var title = ListViewModel()
//    let movies: [Movie]
//
////    func getScale(proxy: GeometryProxy) -> CGFloat {
//////        guard let rootView = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view else { return 1}
////        let midPoint: CGFloat = 125
////
////        let viewFrame = proxy.frame(in: CoordinateSpace.global)
////
////        var scale: CGFloat = 1.0
////        let deltaXAnimationThreshold: CGFloat = 125
////
////        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
////        if diffFromCenter < deltaXAnimationThreshold {
////            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
////        }
////
////        return scale
////    }
//
//
//
//
//
//    var body: some View {
////        HStack {
////            Text(categoryName)
////                .font(.system(size: 14, weight: .heavy))
////                .padding(.vertical, 6)
////                .padding(.horizontal, 12)
////                .background(Color.red)
////                .foregroundColor(.white)
////                .cornerRadius(2)
////            Spacer()
////        }.padding(.horizontal)
////        .padding(.top)
//
//
//
//        //tod
//    }
//}

struct MovieDetailsView: View {
    
    let movie: Movie
    
    var body: some View {
        Image(movie.imageName)
            .resizable()
            .scaledToFill()
            .navigationTitle(movie.title)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()//.previewDevice(PreviewDevice(rawValue: "iPhone7"))
//    }
//}



