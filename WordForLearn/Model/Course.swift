//
//  Course.swift
//  WordForLearn
//
//  Created by Nazmul Hasan on 24/1/21.
//

import SwiftUI

struct Course : Identifiable {
    var id = UUID()
    var title : String
    var subtitle:String
    var image:String
    var color: Color
}

var courses = [
    Course(
        title: "ট্রাম্প শেষ দিনগুলো",
        subtitle: "হোয়াইট হাউসের শেষ দিনগুলোয় ভয়াবহ সব পরিকল্পনা করেছিলেন ডোনাল্ড ট্রাম্প",
        image: "Illustration1",
        color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    Course(
        title: "মার্কিন পররাষ্ট্রনীতিতে",
        subtitle: "মার্কিন পররাষ্ট্রনীতিতে শিগগিরই পরিবর্তন আসছে না",
        image: "Illustration2",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Course(
        title: "পরমাণু আলোচনায়",
        subtitle: "হোয়াইট হাউসের প্রেস সেক্রেটারি জেন সাকি এখন বলছেন, ইরানের সঙ্গে এমন সমঝোতায় যেতে হলে দীর্ঘ সময়ের প্রয়োজন হবে।",
        image: "Illustration3",
        color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Course(
        title: "ট্রাম্প অভিযোগ করেন",
        subtitle: "বাইডেনের জলবায়ু-সংক্রান্ত পরিকল্পনাটি টেক্সাস, ওকলাহোমার মতো তেলসমৃদ্ধ অঙ্গরা জ্যের জন্য অর্থনৈতিক বিপর্যয় বয়ে আনতে পারে।",
        image: "Illustration4",
        color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
    
    
]
