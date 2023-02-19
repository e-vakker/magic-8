//
//  ContentView.swift
//  Magic 8 iPhone
//
//  Created by Jevgeni Vakker on 31.08.2022.
//

import SwiftUI
import CoreMotion

struct Magic8View: View {
    // Switching screens with a magic triangle and information about the application
    @State var showAbout: Bool = false
    var body: some View {
        VStack {
            if showAbout {
                AboutView()
                    .onLongPressGesture {
                        withAnimation {
                            showAbout.toggle()
                        }
                    }
            } else {
                MagicTriangle()
                    .onLongPressGesture {
                        withAnimation {
                            showAbout.toggle()
                        }
                    }
            }
        }
        
    }
}

struct AboutView: View {
    var body: some View {
        ZStack {
            AboutMe()
        }
    }
}

struct Magic8View_Previews: PreviewProvider {
    static var previews: some View {
        Magic8View()
    }
}
