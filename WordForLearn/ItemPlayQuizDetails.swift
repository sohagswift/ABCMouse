//
//  ItemPlayQuizDetails.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 25/1/21.
//

import SwiftUI

struct ItemPlayQuizDetails: View {
    var course: Course = courses[0]
    var namespace : Namespace.ID
    var body: some View {
        VStack {
            ScrollView {
                CategoryItem(course: course)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height:300)
                
                VStack{
                    ForEach(0 ..< 5) { item in
                        CategoryRow()
                    }
                }
                
            }
            
        }.background(Color.white)
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        .transition(
            .asymmetric(insertion:
                            AnyTransition
                            .opacity
                            .animation(Animation.spring().delay(0.0)),
                        removal:
                            AnyTransition
                            .opacity
                            .animation(Animation.spring()))
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct ItemPlayQuizDetails_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ItemPlayQuizDetails(namespace: namespace)
    }
}
