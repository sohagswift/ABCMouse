//
//  WebSideLodeView.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 7/7/21.
//

import SwiftUI

struct TestWebView: View {
    @State var word: String
    @State private var shouldRefresh = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var incomePresented: Bool
    @State var workState = WebView.WorkState.initial
    var body: some View {
        VStack{
            
            HStack(spacing: 12) {
                Button(action: {
                    withAnimation {
                        //  manager.selectedRecipe = manager.getCurrentRecipe()
                       // self.presentationMode.wrappedValue.dismiss()
                        incomePresented = false
                    }
                }, label: {
                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.green)
//                            .frame(width: 50, height: 50)
//                            .rotationEffect(.degrees(45))

                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                })
                Spacer()
                
                Text("======")
//
//                Button(action: {
//                    withAnimation {
//                          //manager.selectedRecipe = manager.getCurrentRecipe()
//                      //  textToSpeach(manager.selectedPlaySring)
//
//
//
//                    }
//                }, label: {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.green)
//                            .frame(width: 50, height: 50)
//                            .rotationEffect(.degrees(45))
//
//                        Image(systemName: "goforward")
//                            .font(.system(size: 20, weight: .bold))
//                            .foregroundColor(.white)
//                    }
//                })

                Spacer()

                Button(action: {
                    withAnimation {
                        //  manager.selectedRecipe = manager.getCurrentRecipe()

                        self.shouldRefresh = true
                    }
                }, label: {
                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.green)
//                            .frame(width: 50, height: 50)
//                            .rotationEffect(.degrees(45))

                        Image(systemName: "goforward")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                }).padding(.bottom,3)

                
            }.padding([.leading,.trailing],15)
                .zIndex(100)
               // .background(Color(UIColor.green))
                
            
            
            ZStack{
                Text("loading ....")
                WebView(query:word , reload: $shouldRefresh, workState: $workState)
            }
           
        }
    }
}


import WebKit

struct WebView: UIViewRepresentable{
    
    enum WorkState: String {
            case initial
            case done
            case working
            case errorOccurred
        }
    
    

    let query : String
    // optional, if absent, one of below search servers used
    @Binding var reload: Bool
    @Binding var workState: WorkState
    

    private let webview = WKWebView()

//    fileprivate func loadRequest(in webView: WKWebView) {
//            var urlString = query
//           // urlString = urlString.replacingOccurrences(of: " ", with: "+")
//            let url = URL(string: urlString)
//        webView.load(URLRequest(url: url!))
//
//
//    }
    
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

    
    

    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
//        if reload {
//            loadRequest(in: uiView)
//            DispatchQueue.main.async {
//                self.reload = false     // must be async
//            }
//        }
        
        switch self.workState {
              case .initial:
                  if let url = URL(string: self.query) {
                      uiView.load(URLRequest(url: url))
                  }
              default:
                  break
              }
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
          self.parent.workState = .working
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            self.parent.workState = .errorOccurred
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.parent.workState = .done
        }

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}

