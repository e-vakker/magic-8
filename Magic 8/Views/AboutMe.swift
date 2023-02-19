//
//  AboutMe.swift
//  Magic 8 iPhone
//
//  Created by Jevgeni Vakker on 08.09.2022.
//

import SwiftUI

// The UI with information about me, etc.
struct AboutMe: View {
    var body: some View {
        ZStack{
            VStack {
                Text("Magic 8 iPhone")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Final Project for CS50")
                    .font(.title3)
                    .foregroundColor(Color.gray)
                Text("")
                Text("Thanks: hackingwithswift.com")
                    .font(.body)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Spacer()
                Text("By Jevgeni Vakker")
                    .font(.caption)
                    .fontWeight(.regular)
            }
        }
    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
