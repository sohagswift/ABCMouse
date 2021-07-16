//
//  ContentView.swift
//  MoviesParallaxDemo
//
//  Created by Brian Voong on 1/9/21.
//

import SwiftUI
import StoreKit

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
    
    @StateObject var storeManager: StoreManager
    @State var openInAppParcace = false
    @State var isForReview  = false
    
    
//    init() {
//        UINavigationBar.appearance().barTintColor = .systemBackground
//    }
    
    let topMovies: [Movie] = [//learing
        .init(title: "Level 1", imageName: "life1"),
        .init(title: "Level 2", imageName: "findit"),
        .init(title: "Level 3", imageName: "learnObject"),
        .init(title: "Art", imageName: "drawing"),
       // .init(title: "Level 4", imageName: "life5"),
       // .init(title: "Level 5", imageName: "life6"),
       // .init(title: "Level 6", imageName: "life6"),
    ]
  
    let animationMovies: [Movie] = [
        .init(title: "Level 4", imageName: "backtotheschool"),
        .init(title: "Level 5", imageName: "traceabc"),
        .init(title: "Level 6", imageName: "tracenumber"),
        .init(title: "Art", imageName: "drawing"),
        //.init(title: "Level 8", imageName: "life6"),
        //.init(title: "Level 10", imageName: "life2")
    ]
    
    
    let dramaMovies: [Movie] = [
        .init(title: "Level 7", imageName: "LearnNumber"),
        .init(title: "Level 8", imageName: "colorletter"),
        .init(title: "Level 9", imageName: "learnColor"),
        .init(title: "Art", imageName: "drawing"),
        //.init(title: "Level 12", imageName: "life6"),
        //.init(title: "Level 10", imageName: "life2")
    ]
    
    let sincMovies: [Movie] = [
        .init(title: "Level 10", imageName: "whichone"),
        .init(title: "Level 11", imageName: "startwith"),
        .init(title: "Level 12", imageName: "missingletter"),
        .init(title: "Art", imageName: "drawing"),
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
                            Text("KidS_WOrLd".localizedStringForKey()).font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                        }.background(Image("Certificate3")
                                        .resizable()
                                        .scaledToFill())
                        Spacer()
                        refreshdButton(imageName: "lock.shield")
                        .padding([.trailing,.top], 20)
                        .onTapGesture{
                            openInAppParcace = true
                        }
                    }
                }
                
                          
              
                  
                    ScrollView {
                        
                 
                      //  Divider().padding(.leading, 16)
                        MoviesCarousel(storeManager: storeManager, categoryName: "Top Movies of 2020", movies: topMovies)
                        Divider().padding(.leading, 16)
                        MoviesCarousel(storeManager: storeManager,categoryName: "Animated Movies", movies: animationMovies)
                        Divider().padding(.leading, 16)
                        MoviesCarousel(storeManager: storeManager,categoryName: "Top Movies of 2020", movies: dramaMovies)
                        Divider().padding(.leading, 16)
                        MoviesCarousel(storeManager: storeManager,categoryName: "Animated Movies", movies: sincMovies)
//                        Divider().padding(.leading, 16)
//                        HStack(spacing: 12) {
//                            Spacer()
//                            Button(action: {
//                                withAnimation {
//                                    isForReview = true
//                                    openInAppParcace = true
//                                   
//                                }
//                            }, label: {
//                                ZStack (alignment: .trailing) {
//
//                                    Text("Review Us")
//                                        .font(.system(size: 20, weight: .regular))
//                                        .foregroundColor(.black)
//
//                                }
//                            })
//                            Button(action: {
//                                withAnimation {
//                                    isForReview = true
//                                    openInAppParcace = true
//                                    
//                                }
//                            }, label: {
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .fill(Color.black)
//                                        .frame(width: 50, height: 50)
//                                        .rotationEffect(.degrees(45))
//
//                                    Image(systemName: "app")
//                                        .font(.system(size: 20, weight: .bold))
//                                        .foregroundColor(.white)
//                                }
//                            })
//                        }.padding(.all,20)
                    }
            }.background(Image("HomeBackground")
                            .resizable()
                            .scaledToFill())
            .fullScreenCover(isPresented: self.$openInAppParcace) {
             
                ParentPermisionView(isForReview: $isForReview, isPresented: $openInAppParcace,storeManager: storeManager)

            }
            .navigationBarHidden(true)
            .navigationBarTitle("") //this must be empty
            .navigationBarBackButtonHidden(true)
            
        }.navigationViewStyle(StackNavigationViewStyle())
       
        
       // .edgesIgnoringSafeArea(.all)
        
      
 
           
            
        
    }
}

class ListViewModel: ObservableObject {

   @Published var title = String()

   func addItem(content : String){
    title = content
   }
    
    
}




struct MoviesCarousel: View {
    
    @StateObject var storeManager: StoreManager
    @State private var outgoingCardPresent = false
    
       var categoryName : String = ""
    @ObservedObject var title = ListViewModel()
    let movies: [Movie]
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
//        guard let rootView = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view else { return 1}
        let midPoint: CGFloat = 125
        
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        
        return scale
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
        switch itemText.lowercased() {
        case "Level 12".lowercased(): //Find the missing la tter _pple
            return AnyView(CategoryViewPicturePlay(Viewindex:4,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 11".lowercased(): //start with the letter
            return AnyView(CategoryViewPicturePlay(Viewindex:0,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 10".lowercased(): //which on is ______
            return AnyView(CategoryViewPicturePlay(Viewindex:2,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 3".lowercased()://which one is word
            return AnyView(CategoryViewPicturePlay(Viewindex:1,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        case "Level 2".lowercased(): //find it
            return AnyView(CategoryViewPicturePlay(Viewindex:3,title:itemText, fromHome: $outgoingCardPresent, storeManager: storeManager))
        default:
            //return AnyView(TryColorView(items: WordData.tryColor))
            
            if !storeManager.isPurchase(){
               // outgoingCardPresent = true
                return AnyView(ParentPermisionView(isForReview: .constant(false), isPresented: $outgoingCardPresent,storeManager: storeManager))
            }
        
            switch itemText.lowercased() {
            case "Level 9".lowercased(): // learn color
                return AnyView(LearnColorView(items: WordData.colors))
            case "Level 8".lowercased():  //color it charater
                return AnyView(TryColorView(items: WordData.getTrytoWirte(color:true)))
            case "Level 7".lowercased():  //learn number
                return AnyView(LearnNumberView(items: WordData.numberWithTextBottom))
            case "Level 6".lowercased(): //traching number
                return AnyView(TryWriteView(items: WordData.typeWordNumbers))
            case "Level 5".lowercased(): //traching latter
                return AnyView(TryWriteView(items: WordData.getTrytoWirte()))
            case "Level 4".lowercased(): //number  / charater  learing
                return AnyView(latterToWordView(fromHome: $outgoingCardPresent))
            case "Level 1".lowercased():
                return AnyView(PlayWordView())
            default:
                return AnyView(TryColorView(items: WordData.tryColor))
            }
        }
        
       
        
        
        
        print(itemText)

//          let value = MenuItem(rawValue: itemText)
//
//          switch value {
//
//          case .some(.firstCase):
//              return AnyView(InvoicesDetail())
//          case.some(.secondCase):
//              return AnyView(ProjectsDetail())
//          case .none:
//              return AnyView(Text("a"))
//          case .some(.thirdCase):
//              return AnyView(StaffDetail())
         // }
      }
    
    var body: some View {
//        HStack {
//            Text(categoryName)
//                .font(.system(size: 14, weight: .heavy))
//                .padding(.vertical, 6)
//                .padding(.horizontal, 12)
//                .background(Color.red)
//                .foregroundColor(.white)
//                .cornerRadius(2)
//            Spacer()
//        }.padding(.horizontal)
//        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(movies, id: \.self) { num in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
//                        NavigationLink(
//                            destination: getDestination(itemText: num.title) /*MovieDetailsView(movie: num)*/.navigationBarHidden(true), isActive: $outgoingCardPresent,
//                            label: {
                                VStack(spacing: 8) {
                                    Image(num.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 180)
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
//                                               // outgoingCardPresent = true
//                                                title.addItem(content:  "purchase_require")
//                                            }else{
                                                title.addItem(content:  num.title)
                                           // }
                                    
                                   
                                    outgoingCardPresent = true
                                }
//                            })
                        
                            .scaleEffect(.init(width: scale, height: scale))
//                            .animation(.spring(), value: 1)
                            .animation(.easeOut(duration: 1))
                            
                            .padding(.vertical)
                    }
                    .frame(width: 125, height: 380)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)
                    
                  
                  
                }

                Spacer()
                    .frame(width: 16)
                

            }
                            .fullScreenCover(isPresented: self.$outgoingCardPresent) {
                                getDestination(itemText: title.title)
            
                            }
          
        }
       
        //tod
    }
}

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



