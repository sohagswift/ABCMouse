//
//  CategorySection.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 25/1/21.
//

import SwiftUI

struct CategorySection: Identifiable, Hashable {
   var id = UUID()
    var title : String
    var subtitle : String
    var logo : String
    var color : Color

}

var categorySections = [
    CategorySection( title: "ট্রাম্প শেষ দিনগুলো",
                     subtitle: "হোয়াইট হাউসের শেষ দিনগুলোয় ভয়াবহ সব পরিকল্পনা করেছিলেন ডোনাল্ড ট্রাম্প",
                     logo: "greaterthan.circle.fill",
                     color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    CategorySection( title: "ট্রাম্প শেষ দিনগুলো",
                     subtitle: "হোয়াইট হাউসের শেষ দিনগুলোয় ভয়াবহ সব পরিকল্পনা করেছিলেন ডোনাল্ড ট্রাম্প",
                     logo: "greaterthan.circle.fill",
                     color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    CategorySection( title: "ট্রাম্প শেষ দিনগুলো",
                     subtitle: "হোয়াইট হাউসের শেষ দিনগুলোয় ভয়াবহ সব পরিকল্পনা করেছিলেন ডোনাল্ড ট্রাম্প",
                     logo: "greaterthan.circle.fill",
                     color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    CategorySection( title: "ট্রাম্প শেষ দিনগুলো",
                     subtitle: "হোয়াইট হাউসের শেষ দিনগুলোয় ভয়াবহ সব পরিকল্পনা করেছিলেন ডোনাল্ড ট্রাম্প",
                     logo: "greaterthan.circle.fill",
                     color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    CategorySection( title: "ট্রাম্প শেষ দিনগুলো",
                     subtitle: "হোয়াইট হাউসের শেষ দিনগুলোয় ভয়াবহ সব পরিকল্পনা করেছিলেন ডোনাল্ড ট্রাম্প",
                     logo: "greaterthan.circle.fill",
                     color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    CategorySection( title: "ট্রাম্প শেষ দিনগুলো",
                     subtitle: "হোয়াইট হাউসের শেষ দিনগুলোয় ভয়াবহ সব পরিকল্পনা করেছিলেন ডোনাল্ড ট্রাম্প",
                     logo: "greaterthan.circle.fill",
                     color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
]



struct Item : Identifiable, Hashable  {
    var id = UUID()
    var name : String
}

struct CategorySectionContent: Identifiable, Hashable {
   var id = UUID()
    var title : String
    var subtitle : String
    var image : String
    var color: Color
    var items : [Item]
    
    init(title: String,
         subtitle: String,
         image: String,
         color: Color,
         items:[String]) {
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.color = color
        self.items = [Item]()
       for item in items {
        self.items.append(Item(name: item))
       }
    }
    
    

}

var categorySectionContents = [
    CategorySectionContent(title: "ALPHABET",
                           subtitle: "More than 26+",
                           image: "Illustration5",
                           color: Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)),
                           items: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]),
    
    CategorySectionContent(title: "Numbers",
                           subtitle: "More than 9+",
                           image: "Illustration5",
                           color: Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)),
                           items: ["0","1","2","3","4","5","6","7","8","9"]),
    
    CategorySectionContent(title: "BODY PARTS",
                           subtitle: "More than 100+",
                           image: "greaterthan.circle.fill",
                           color: Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)),
                           items: ["ankle","beard","blood","brain","ear","elbow","eye-brow","eye","face","fat","finger","foot","hair","hand","head","knee","leg","lips","man","mouth","nail","nose","stomach","tear","teeth","tongue","tooth","women"]),
    
    CategorySectionContent(title: "ANIMALS",
                           subtitle: "More than 100+",
                           image: "greaterthan.circle.fill",
                           color: Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)),
                           items: ["ant","bat", "bear", "bee", "bird", "butterfly", "camel", "cat", "cheetah","chick", "chicken", "cow","crab" ,"crocodile", "deer", "dog", "dolphin", "duck", "eagle", "elephant", "fish", "fly", "fox", "frog", "giraffe", "goat", "gorilla", "horse","impala","jackal","kangaroo", "lion", "lobster", "monkey", "mosquito", "ostrich","owl", "panda", "parrot","pigeon", "polar_bear", "rabbit", "rat","rooster", "shark", "sheep", "shrimp","snail", "snake","spider", "squirrel", "tiger","turkey", "turtle", "wolf","whale","zebra"]),

    CategorySectionContent(title: "FOODS",
                           subtitle: "More than 100+",
                           image: "greaterthan.circle.fill",
                           color: Color(#colorLiteral(red: 0.6941176471, green: 0.8039215686, blue: 0.8392156863, alpha: 1)),
                           items: ["apple pie","beef","biscuit","bread","butter","cake","cheese","cheeseburger","chicken chop","chocolate_chip_cookie","chocolate","cracker","curry","delmonico's steak","egg","fish","french_fries","hamburger","hot dog","ice cream","ice","jelly","lamb","loaf","milk","nachos","noodles","oil","pizza","rice","salad","salmon","salt","sandwich","sausage","soup","spaguetti","steak","thanksgiving dinner","wheat"]),
    
]

import Foundation
import UIKit

struct WordData{
    
      static let categoryArray = [ "ANIMALS",
                                   "COLORS",
                                   "COUNTRIES",
                                   "FRUITS",
                                   "VEGETABLES",
                                   "FOODS",
                                   "DRINK",
                                   "SPORTS",
                                   "LIVING ROOM",
                                   "TRANSPORTS",
                                   "CLOTHES",
                                   "SCHOOL OBJECTS",
                                   "shapes",
                                   "KITCHEN",
                                   "Professions",
                                   "FLOWER",
                                   "BATHROOM",
                                   "BODY PARTS",
                                   "VERBS",
                                   
                                   "ALPHABET",
                                   "NUMBERS",
                                   ]
    
        // ok
      
    
    static let animals = ["ant","bat", "bear", "bee", "bird", "butterfly", "camel", "cat", "cheetah","chick", "chicken", "cow","crab" ,"crocodile", "deer", "dog", "dolphin", "duck", "eagle", "elephant", "fish", "fly", "fox", "frog", "giraffe", "goat", "gorilla", "horse", "kangaroo", "lion", "lobster", "monkey", "mosquito", "ostrich","owl", "panda", "parrot","pigeon", "polar_bear", "rabbit", "rat","rooster", "shark", "sheep", "shrimp","snail", "snake","spider", "squirrel", "tiger","turkey", "turtle", "wolf","whale","xerus","zebra","ant"]
    
    // image and text is ok
    static let bathroom = ["bath mat","bathtub", "bucket","clothespin","comb","hairbrush","hairdryer","hanger","mirror","mop","hand soap","hand towel","plunger","razor","scissors","shampoo","shower curtain","shower","sink","soap","toilet","toilet cleaner","toilet brush","toilet paper","toothbrush","toothpaste","towel","trash can","water tap","bath mat",]

    // image and text is ok
    static let bodyParts = ["ankle","beard","blood","brain","ear","elbow","eye-brow","eye","face","fat","finger","foot","hair","hand","head","knee","leg","lips","man","mouth","nail","nose","stomach","tear","teeth","tongue","tooth","women","ankle"]
    
    // image and text is ok
    static let clothes = ["belt","blouse","boot","cap","coat","dress","glove","hat","hijab","high heel","scarf","shirt","shoe","skirt","slipper","sock","spectacles","sweater","t-shirt","tie","towel","trouser","turban","belt"]
    
    static let countries = ["America", "England", "Australia","South Africa", "New Zealand","Canada", "afghanistan","albania","algeria","angola","Argentina",  "Austria","azerbaijan","bahrain","bangladesh","belarus","Belgium","bolivia","Brazil","Brunei","Bulgaria","cameroon","chile","China","colombia","costa-rica","croatia","Cyprus","Czech Republic","Denmark","ecuador","Egypt","Estonia","ethiopia","European Union", "Finland","France","Germany","ghana","Greece","guatemala","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","iraq","Ireland","israel","Italy","ivory-coast","Japan","jordan","kazakhstan","kenya","Kuwait","Latvia","lebanon","libya","Lithuania","Luxembourg","macao","Malaysia","mali","Mexico","morocco","myanmar","nepal","Netherland","nigeria","north korea","norway","Oman","pakistan","palestine","panama","paraguay","peru","philippines","poland","portugal","Qatar","Romania","Russia","Saudi Arabia","senegal","serbia","Singapore","Slovakia","Slovenia","somalia","South Korea","Spain","sri-lanka","sudan","Sweden","Switzerland","Syria","Taiwan","tanzania","thailand","tunisia","Turkey","turkmenistan","uganda","ukraine","arab emirates", "uruguay","uzbekistan","vietnam","yemen","America",]
    
    static  let colors = ["white","yellow", "blue", "orange","magenta", "green", "black","red","purple", "cyan", "brown","darkgray", "grey", "lightgray", "lime", "pink", "teal", "lavender", "navy", "beige", "maroon", "mint", "olive", "coral","peach","silver","gold","white"]
    
    static let drink = ["cappuccino","coffee","honey","hot chocolate","juice","milk","milkshake","soft drink","tea","water","cappuccino"]
    
    static let flowers = ["anemone","aster","bird of paradise","carnation","cherry blossom","chrysanthemums","daffodil","dahlia","daisy","gerbera","hyacinth","iris","jasmine","lilac","lily","lotus","magnolia","orchid","pansy","rose","sunflower","tulip","water_lily","anemone"]
    
    var imgage = ["gold","umbrella","van","zebra","xerus"]
    // q,u,v,x,y,z
    static let foods = ["apple pie","beef","biscuit","bread","butter","cake","cheese","cheeseburger","chicken chop","chocolate_chip_cookie","chocolate","cracker","curry","delmonico's steak","egg","fish","french_fries","hamburger","hot dog","ice cream","ice","jelly","lamb","loaf","milk","nachos","noodles","oil","pizza","rice","salad","salmon","salt","sandwich","sausage","soup","spaguetti","steak","thanksgiving dinner","wheat","apple pie"]
    //e,f,i,n,q,u,v,x,y,z
    static let fruits = ["apple","apricot","avocado","banana","black berry","black cherry","blueberry","Boysenberry","cherimoyas","cherry","Coconut","Common fig","Durian","grape","grapefruit","green apple","green grape","Horned melon","Jackfruit","kiwi","lemon","lime","Longan","Loquat","Lychee","mango","melon","Olive","orange","papaya","peach","pear","pineapple","Pitaya","plum","pomegranate","Purple mangosteen","raspberry","red cherry","red grape","star fruit","strawberry","tomato","watermelon","apple"]
    
    static let kitchen = ["blender","bottle","can opener","coffee pot","colander","cup","drawer","fork","frying_pan","glass of water","grater","grill pan","juicer","kettle","kitchen board","kitchen Scale","knife sharpener","knife","ladle","measure cup","measuring spoons","microwave oven","mixer","mixing bowl","oven mitt","peeler","plate","pot","potato masher","refrigerator","rice cooker","saucepan","shears","soup spoon","spatula","sponge","spoon","stove","tea_pot","thermometer","toaster","tongs","water_glass","whisk","blender"]
    
    
    static let livingRoom = ["alarm clock","basket","bed","blanket","bolster","bookshelf","cabinet","candle","chair","computer","curtain","desk","door","fan","fireplace","iron","lamp","mirror","pillow","sliper","sofa","trash can","umbrella","wall clock","wardrobe","window","alarm clock"]
    
    
    
    static let  professions = ["astronaut","baker","barber","butcher","carpenter","chef","cleaner","dentist","detective","doctor","driver","electrician","engineer","farmer","firefighter","judge","lecture","mathematician","mechanic","musician","nurse","painter","pediatrician","pharmacist","pilot","police man","postman","sailor","scientist","singer","software developer","soldier","statistician","student","surgeon","teacher","waiter","writer","astronaut"]
    
    static let schoolObject = ["backpack","beaker","binder","blackboard","book","calculator","chair","classroom","clip","alarm clock","color_pencils","compass","computer","desk","eraser","file holder","flask","funnel","globe","glue","magnifying glass","map","microscope","notebook","paint brush","palette","paper","pen","pencil case","pencil","pin","protractor","ruler","school bag","school bus","school locker","scissors","set square","sharpener","stapler","test tube","wall_clock","watch","backpack"]
    
    static let shapes = ["bleach","circle","decagon","hexagon","oval","pentagon","rectangle","square","star","triangle","circle","bleach"]
    
    static let sports = ["athletics","badminton","baseball","basketball","boxing","chess","cricket","cycling","field hockey","formula 1","golf","hockey","ice hockey","nascar","rugby","soccer","swimming","table tennis","tennis","volleyball","wrestling","athletics"]
    
    static let transports = ["airplane","ambulance","bicycle","boat","bulldozer","bus","car","carriage","excavator","ferry","fire truck","forklift","helicopter","lorry","motorbike","motorcycle","pirate ship","police car","pram","scooter","ship","space shuttle","submarine","tank","taxi","tractor","train","truck","van","yacht", "airplane"]
    
    static let vegetables = ["artichoke","asparagus","bean","beetroot","bell pepper","broccoli","cabbage","capsicum","carrot","cauliflower","celery","chilli","cinnamon","coriander","corn","cucumber","eggplant","garlic","ginger","ladies finger","lettuce","mushroom","olives","onion","pea","potato","pumpkin","spinach","sweet corn","sweet potato","tomato", "artichoke"]
    
    static let verbs = ["announce","bind","bring","build","buy","catch","check","close","cook","cry","cut","dance","dig","draw","drink","eat","educate","feed","forbid","hear","jump","listen","love","meet","play","print","read","run","see","sell","shop","show","sing","sleep","smile","sneeze","stand","swim","teach","think","walk","wash","win","write","announce"]
    
    static let typeWordAlphabets = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","-",]

    static let typeWordNumbers = ["0","1","2","3","4","5","6","7","8","9","Delete"]

    static let typeWordNumbersWithX = ["0","1","2","3","4","5","6","7","8","9","X"]

}



struct CategorySection_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
