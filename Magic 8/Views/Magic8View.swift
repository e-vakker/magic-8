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
    
    @StateObject private var motion = MotionManager()
    
    @Environment(\.scenePhase) var scenePhase
    
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
                MagicTriangle(motion: motion)
                    .onLongPressGesture {
                        withAnimation {
                            showAbout.toggle()
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                motion.stopDeviceMotionUpdates()
            case .inactive:
                motion.stopDeviceMotionUpdates()
            case.active:
                motion.startDeviceMotionUpdates()
            @unknown default:
                break
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
