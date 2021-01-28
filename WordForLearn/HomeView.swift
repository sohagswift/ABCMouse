//
//  ContentView.swift
//  MoviesParallaxDemo
//
//  Created by Brian Voong on 1/9/21.
//

import SwiftUI

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
    
    init() {
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    let topMovies: [Movie] = [
        .init(title: "Fun Education", imageName: "life1"),
        .init(title: "Easy to learn", imageName: "life2"),
        .init(title: "Easy Word", imageName: "life3"),
        .init(title: "Soul", imageName: "life4"),
        .init(title: "Tenet", imageName: "life5"),
        .init(title: "Avengers: Endgame", imageName: "life6"),
    ]
    
    let animationMovies: [Movie] = [
        .init(title: "Soul", imageName: "life4"),
        .init(title: "Tenet", imageName: "life5"),
        .init(title: "Avengers: Endgame", imageName: "life6"),
        .init(title: "Captain Marvel", imageName: "life1")
    ]
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                
                VStack{
                    Text("KidS WOrLd").font(.system(.largeTitle, design: .rounded)).bold().padding(.top, 0).padding(.leading, 16).foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                }.background(Image("Certificate3")
                                .resizable()
                                .scaledToFill())
                
               
              
                  
                    ScrollView {
                 
                      //  Divider().padding(.leading, 16)
                        MoviesCarousel(categoryName: "Top Movies of 2020", movies: topMovies)
                        Divider().padding(.leading, 16)
                        MoviesCarousel(categoryName: "Animated Movies", movies: animationMovies)
                        Divider().padding(.leading, 16)
                        MoviesCarousel(categoryName: "Top Movies of 2020", movies: topMovies)
                        Divider().padding(.leading, 16)
                        MoviesCarousel(categoryName: "Animated Movies", movies: animationMovies)
                        Divider().padding(.leading, 16)
                    }
            }.background(Image("HomeBackground")
                            .resizable()
                            .scaledToFill())
            .navigationBarHidden(true)
        }
       
        
       // .edgesIgnoringSafeArea(.all)
        
      
 
           
            
        
    }
}

struct MoviesCarousel: View {
    
    let categoryName: String
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
                        NavigationLink(
                            destination: CategoryView() /*MovieDetailsView(movie: num)*/,
                            label: {
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
                                    Text(num.title)
                                        .font(.system(size: 16, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
//                                    HStack(spacing: 0) {
//                                        ForEach(0..<5) { num in
//                                            Image(systemName: "star.fill")
//                                                .foregroundColor(.orange)
//                                                .font(.system(size: 14))
//                                        }
//                                    }.padding(.top, -4)
                                }
                            })
                        
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
        }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewDevice(PreviewDevice(rawValue: "iPhone XS"))
    }
}



