//
//  ParentPermisionView.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 8/7/21.
//

import SwiftUI
import StoreKit

 class ParentViewModel: ObservableObject {

   @Published var pazzal =  [String]()

   func addItem(content :  [String]){
    pazzal = content
   }
//    
//    func getPazzal(array : [String])->String{
//        
//    }

    
    
}


//ParentPermisionView
struct ParentPermisionView: View {
    
    //from income
  //  @Binding var isForReview : Bool
    @Binding var isPresented: Bool
    @StateObject var storeManager: StoreManager
    
    //to out going
    @State var openInAppParcace: Bool = false
 
    
    
    @ObservedObject var pazzal = ParentViewModel()
    
    
  //  @State private var number: String = ""
    @State private var str = ""
    @State private var parray = [String]()
    @State private var showingAlert  = false
   // @State private var pazzal = [String]()
    @State private var isOk = 0
    let arrayNubmer = [ "one", "two", "three","four", "five", "six", "seven", "eight", "nine"]
    var body: some View {
        VStack(alignment: .center) {
            
            HStack{
                Spacer()
                refreshdButton(color: Color.black)
                .padding(.trailing, 20)
            .onTapGesture{
                withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                   // isPresented = false
               
                    isPresented = false
                }
            }
            }
          
            VStack{
             
                Text("Ask_Your_Parents".localizedStringForKey()).font(.title).bold()
                    .multilineTextAlignment(.center)
                Text("To_continue_tap".localizedStringForKey()).font(.headline)
                Text(str).font(.title2).bold()
               
                
//                TextField("Enter your number", text: $number).frame( height: 44, alignment: .center)
                
                
            }
            .padding()
           // Spacer(minLength: 10)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 1), count: 3),spacing:1, content: {
                
                ForEach(1...9,id:\.self){ index in
                    VStack(spacing:15){
                        Image(systemName: getNubmer(number: index)).resizable()
                            .aspectRatio(contentMode: .fit)
                            //.frame(height: 150)
//                        Text("\(index)")
//                            .font(.title2)
//                            .fontWeight(.heavy)
//                            .foregroundColor(.black)
                        
                    } .onTapGesture {
//                        set = "Round_\(index)"
//                        optionChosed = index
//                        show.toggle()
                        
                        if arrayNubmer[index - 1].lowercased() == pazzal.pazzal[isOk].lowercased() {
                            print("okey go ahead")
                            isOk =  isOk + 1
                        }else{
                            print("ask your pranet\(pazzal.pazzal) , \(arrayNubmer[index - 1]) === \(pazzal.pazzal[isOk]) ")
                            showingAlert = true
                        }
                        
                        if isOk == 3 {
                           
                            if  TStorage.AcccessParent{
                                isPresented = false
                                TStorage.AcccessParent = false
                            }else{
                                openInAppParcace = true
                            }
                          
                        }
                        
                    }
                    
                }
                .alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Ask_Your_Parents".localizedStringForKey()),
                                message: Text("Only_for_parents.".localizedStringForKey()),
                                dismissButton: .destructive(Text("Okey".localizedStringForKey())) {
                                    //print("Deleting...")
                                    isPresented = false
                                }
                              //  secondaryButton: .cancel()
                            )
                        }
                
             
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                
            })
            Spacer()
            .fullScreenCover(isPresented: self.$openInAppParcace) {
             
                StoreBuyView(isPresented: $openInAppParcace ,storeManager: storeManager)

            }
            
        }
  
     
        
        .onLoad(){
           
            for i in 0..<3 {
                let n = arrayNubmer[Int.random(in: 0..<arrayNubmer.count)].capitalized
                parray.append(n)
                str.append(n)
                if i < 2 {
                    str.append(", ")
                }
            }
            pazzal.addItem(content: parray)
        }
//        .onLoad{
//            pazzal.addItem(content: arrayNubmer)
//        }
    }
    func getNubmer(number: Int)->String{
        var str = "\(number).square"
        if number == 10 {
             str = "0.square"
        }
//        else if number == 11 {
//            str = "0.square"
//        }
      
        return str
    }

    
    func rateApp() {
//         if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") {
//
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//
//
//        }
        
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                  SKStoreReviewController.requestReview(in: scene)
              }
    }
    
}

//struct ParentPermisionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParentPermisionView()
//    }
//}


struct TStorage {
    private enum Keys {
        static let acccessParent = "AcccessParent"
        static let varifyParent = "varifyParent"
        static let wordfocus = "wordfocus"
        static let isFastTimeRun = "isFastTimeRun"
       
    }
    
    
    static var AcccessParent: Bool {
        set {
            
            UserDefaults.standard.set(newValue, forKey: Keys.acccessParent)
            UserDefaults.standard.synchronize()
        }
        
        get {
            let wordlaring =  UserDefaults.standard.bool(forKey: Keys.acccessParent)
          
            return wordlaring
        }
    }
    
    
    static var VarifyParent: Bool {
        set {
            
            UserDefaults.standard.set(newValue, forKey: Keys.varifyParent)
            UserDefaults.standard.synchronize()
        }
        
        get {
            let wordlaring =  UserDefaults.standard.bool(forKey: Keys.varifyParent)
          
            return wordlaring
        }
    }
    
    
    
    
    static var wordFocus: String {
        set {

            UserDefaults.standard.set(newValue, forKey: Keys.wordfocus)
            UserDefaults.standard.synchronize()
        }

        get {
            return UserDefaults.standard.string(forKey: Keys.wordfocus) ?? "en"
        }
    }
//
//
//    static var partOfSpeachFocus: String {
//        set {
//
//            UserDefaults.standard.set(newValue, forKey: Keys.partOfSpeachFocus)
//            UserDefaults.standard.synchronize()
//        }
//
//        get {
//            return UserDefaults.standard.string(forKey: Keys.partOfSpeachFocus) ?? "All"
//        }
//    }
//
//
    static var isFastTimeRun: Int {
        set {

            UserDefaults.standard.set(newValue, forKey: Keys.isFastTimeRun)
            UserDefaults.standard.synchronize()
        }

        get {
            return UserDefaults.standard.integer(forKey: Keys.isFastTimeRun)
        }
    }
    
    
}



//ParentPermisionView
struct ParentPermisionView2: View {
    
    //from income
  //  @Binding var isForReview : Bool
    @Binding var isPresented: Bool
    @StateObject var storeManager: StoreManager
    
    //to out going
    @State var openInAppParcace: Bool = false
 
    
    
    @ObservedObject var pazzal = ParentViewModel()
    
    
  //  @State private var number: String = ""
    @State private var str = ""
    @State private var parray = [String]()
    @State private var showingAlert  = false
   // @State private var pazzal = [String]()
    @State private var isOk = 0
    let arrayNubmer = [ "one", "two", "three","four", "five", "six", "seven", "eight", "nine"]
    var body: some View {
        VStack(alignment: .center) {
            
            HStack{
                Spacer()
                refreshdButton(color: Color.black)
                .padding(.trailing, 20)
            .onTapGesture{
                withAnimation(.spring(response:0.2,dampingFraction:0.5,blendDuration:0)){
                   // isPresented = false
               
                    isPresented = false
                }
            }
            }
          
            VStack{
             
                Text("Ask_Your_Parents".localizedStringForKey()).font(.title).bold()
                    .multilineTextAlignment(.center)
                Text("To_continue_tap".localizedStringForKey()).font(.headline)
                Text(str).font(.title2).bold()
               
                
//                TextField("Enter your number", text: $number).frame( height: 44, alignment: .center)
                
                
            }
            .padding()
           // Spacer(minLength: 10)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 1), count: 3),spacing:1, content: {
                
                ForEach(1...9,id:\.self){ index in
                    VStack(spacing:15){
                        Image(systemName: getNubmer(number: index)).resizable()
                            .aspectRatio(contentMode: .fit)
                            //.frame(height: 150)
//                        Text("\(index)")
//                            .font(.title2)
//                            .fontWeight(.heavy)
//                            .foregroundColor(.black)
                        
                    } .onTapGesture {
//                        set = "Round_\(index)"
//                        optionChosed = index
//                        show.toggle()
                        
                        if isOk < 3 {
                            if arrayNubmer[index - 1].lowercased() == pazzal.pazzal[isOk].lowercased() {
                                print("okey go ahead")
                                isOk =  isOk + 1
                            }else{
                                print("ask your pranet\(pazzal.pazzal) , \(arrayNubmer[index - 1]) === \(pazzal.pazzal[isOk]) ")
                                showingAlert = true
                            }
                        }else{
                            isOk = 0
                            
                        }
                       
                        
                        if isOk == 3 {
                            
                            NotificationCenter.default.post(name: NSNotification.ImageClick,
                                                                           object: nil, userInfo: ["info": "Test"])
                          
                            TStorage.VarifyParent = true
                            isPresented = false
                            
                            
//                            if  TStorage.AcccessParent{
//                                isPresented = false
//                                TStorage.AcccessParent = false
//                            }else{
//                                openInAppParcace = true
//                            }
                          
                        }
                        
                    }
                    
                }
                .alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Ask_Your_Parents".localizedStringForKey()),
                                message: Text("Only_for_parents.".localizedStringForKey()),
                                dismissButton: .destructive(Text("Okey".localizedStringForKey())) {
                                    //print("Deleting...")
                                    isPresented = false
                                }
                              //  secondaryButton: .cancel()
                            )
                        }
                
             
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                
            })
            Spacer()
//            .fullScreenCover(isPresented: self.$openInAppParcace) {
//
//                StoreBuyView(isPresented: $openInAppParcace ,storeManager: storeManager)
//
//            }
            
        }
  
     
        
        .onLoad(){
           
            for i in 0..<3 {
                let n = arrayNubmer[Int.random(in: 0..<arrayNubmer.count)].capitalized
                parray.append(n)
                str.append(n)
                if i < 2 {
                    str.append(", ")
                }
            }
            pazzal.addItem(content: parray)
        }
//        .onLoad{
//            pazzal.addItem(content: arrayNubmer)
//        }
    }
    func getNubmer(number: Int)->String{
        var str = "\(number).square"
        if number == 10 {
             str = "0.square"
        }
//        else if number == 11 {
//            str = "0.square"
//        }
      
        return str
    }

    
    func rateApp() {
        
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                  SKStoreReviewController.requestReview(in: scene)
              }
    }
    
}



extension NSNotification {
    static let ImageClick = Notification.Name.init("ImageClick")
}
