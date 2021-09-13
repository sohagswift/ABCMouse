//
//  GoogleAds.swift
//  WordForLearn
//
//  Created by MacBook Air M1 on 24/8/21.
//




import SwiftUI
import GoogleMobileAds
import UIKit




public final class SwiftUIMobileAds {
    
    
  
    
//    public static let shared = SwiftUIMobileAds()
    
    public static let testBannerId = "" //"ca-app-pub-3940256099942544/2435281174"
    public static let testInterstitialId = "" //"ca-app-pub-3940256099942544/4411468910"
    public static let testRewardedId = "ca-app-pub-2306555329039690/6374684238"
}


final private class BannerVC: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)

        let viewController = UIViewController()
        view.adUnitID = SwiftUIMobileAds.testBannerId
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct Banner:View{
    var body: some View{
        HStack{
            Spacer()
            BannerVC().frame(width: 320, height: 50, alignment: .center)
            Spacer()
        }
    }
}


final class Interstitial:NSObject, GADFullScreenContentDelegate{
    var interstitial: GADInterstitialAd?
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-8123415297019784/4985798738",
                                    request: request,
                          completionHandler: { (ad, error) in
                            if let error = error {
                              print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                              return
                            }
                            self.interstitial = ad
                            self.interstitial?.fullScreenContentDelegate = self
                          }
        )
    }
    
    func showAd(){
        
        
        if let ad = interstitial {
            ad.present(fromRootViewController: (UIApplication.shared.windows.first?.rootViewController)!)
          } else {
            print("Ad wasn't ready")
          }
        
//        if self.interstitial.isReady{
//           let root = UIApplication.shared.windows.first?.rootViewController
//           self.interstitial.present(fromRootViewController: root!)
//        }
//       else{
//           print("Not Ready")
//       }
    }
    
//    func interstitialDidDismissScreen(_ ad: GADInterstitialAd) {
//        self.interstitial = GADInterstitial(adUnitID: interstitialID)
//        LoadInterstitial()
//    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("loading. ")
        LoadInterstitial()
    }
    
}

struct InterstitialContentView:View{
    var interstitial:Interstitial
    
    init(){
        self.interstitial = Interstitial()
    }
    
    var body : some View{
      Button(action: {self.interstitial.showAd()}){
        Text("My Button")
      }
    }
}


final class Rewarded: NSObject , ObservableObject , GADFullScreenContentDelegate{
    
    var rewardedAd: GADRewardedAd?
    var status : Int?
    
  
    
    var rewardFunction: ((Int) -> Void)? = nil
   
    
    override init() {
        super.init()
       
        LoadRewarded()
    }
    
    func LoadRewarded(){
        let request = GADRequest()
        GADRewardedAd.load(withAdUnitID: SwiftUIMobileAds.testRewardedId,
                                request: request, completionHandler: { (ad, error) in
                                  if let error = error {
                                    print("Rewarded ad failed to load with error: \(error.localizedDescription)")
                                    return
                                  }
                                  self.rewardedAd = ad
                                  self.rewardedAd?.fullScreenContentDelegate = self
                                }
        )
    }
    
    func showAd(rewardFunction: @escaping (Int) -> Void){
        print("loading")
        if let ad = rewardedAd {
            self.rewardFunction = rewardFunction
            
            
            UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: {
                ad.present(fromRootViewController: (UIApplication.shared.windows.first?.rootViewController)!,
                           userDidEarnRewardHandler: {
                             let reward = ad.adReward
                             // TODO: Reward the user.
                            print("Now You can show..  \(reward)")
                            self.status = 30
                            rewardFunction(self.status!)
                                    
                           }
                  )
            })
            
   
          } else {
            print("Ad wasn't ready")
            self.status = 5
            rewardFunction(self.status!)
          
          }
        
//        if self.rewardedAd.isReady{
//            self.rewardFunction = rewardFunction
//            let root = UIApplication.shared.windows.first?.rootViewController
//            self.rewardedAd.present(fromRootViewController: root!, delegate: self)
//        }
//       else{
//           print("Not Ready")
//       }
        
      
        if let _status = status {
            rewardFunction(_status)
        }
        
    }
    
//    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
//        if let rf = rewardFunction {
//            rf()
//        }
//    }
//
//    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
//        self.rewardedAd = GADRewardedAd(adUnitID: rewardID)
//        LoadRewarded()
//    }
    
    
    /// Tells the delegate that the rewarded ad was presented.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        self.status = nil
      print("Rewarded ad presented.")
    }
    /// Tells the delegate that the rewarded ad was dismissed.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
     
       
      print("Rewarded ad dismissed.")
        LoadRewarded()
        
        if self.status ?? 0 > 20 {
            self.status = 0
            NotificationCenter.default.post(name: NSNotification.ImageClick,
                                                           object: nil, userInfo: ["info": "Test"])
        }
        self.status = nil
      
    }
    /// Tells the delegate that the rewarded ad failed to present.
    func ad(_ ad: GADFullScreenPresentingAd,
        didFailToPresentFullScreenContentWithError error: Error) {
     
      print("Rewarded ad failed to present with error: \(error.localizedDescription).")
        self.status = -1
    }
    

    
}

extension NSNotification {
    static let ImageClick = Notification.Name.init("ImageClick")
}



struct rewardedContentView:View{
    var rewardAd = Rewarded()
    
    

    var body : some View{
        
        
        Button(action: {
                
            self.rewardAd.showAd(rewardFunction: { status in
                      print("Give Reward \(status)")
                    })
            
            
            
        }){
          Text("My Button")
        }
        
//        Button(<#LocalizedStringKey#>, action: {
//        self.rewardAd.showAd(rewardFunction: {
//          print("Give Reward")
//        }
//      ){
//        Text("My Button")
//      }
    }
}
