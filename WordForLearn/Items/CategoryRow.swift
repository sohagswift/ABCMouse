//
//  CategoryRow.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 21/1/21.
//

import SwiftUI

struct CategoryRow: View {
    var item : CategorySection = categorySections[0]
    var body: some View {
        HStack{
            Image(systemName: item.logo).imageScale(.large).foregroundColor(.orange)
        
            VStack(alignment: .leading,spacing:2.0){
                Text(item.title).font(.subheadline).bold()
                Text(item.subtitle).font(.footnote).foregroundColor(.secondary)
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
