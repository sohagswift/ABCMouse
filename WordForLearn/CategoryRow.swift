//
//  CategoryRow.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct CategoryRow: View {
    var body: some View {
        HStack{
            Image(systemName: "greaterthan.circle.fill").imageScale(.large).foregroundColor(.black)
        
            VStack(alignment: .leading,spacing:2.0){
                Text("শপথ নিলেন জো বাইডেন").font(.subheadline).bold()
                Text("যুক্তরাষ্ট্রের ৪৬তম প্রেসিডেন্ট হিসেবে শপথ নিলেন জো বাইডেন। প্রধান বিচারপতি জন রবার্টস তাঁকে শপথ বাক্য পাঠ করান।").font(.footnote).foregroundColor(.secondary)
            }
            Spacer()
        }.font(.system(size: 34, weight: .light, design: .rounded))
        .padding() 
      
     
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}
