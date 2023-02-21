//
//  MagicTriangle.swift
//  Magic 8 iPhone
//
//  Created by Jevgeni Vakker on 03.09.2022.
//

import SwiftUI

struct MagicTriangle: View {
    @ObservedObject var motion:MotionManager
    
    @State private var text = "Ask a question and shake".uppercased()
    @State private var degrees = 0.0
    
    @State private var colorFill = LinearGradient(gradient: Gradient(colors: [
        Color(hue: 0.68, saturation: 0.819, brightness: 0.658),
        Color(hue: 0.68, saturation: 0.5, brightness: 0.658)
    ]), startPoint: .bottom, endPoint: .top)
    
    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("x: \(motion.x, specifier: "%.2f")")
                Text("y: \(motion.y, specifier: "%.2f")")
                Text("z: \(motion.z, specifier: "%.2f")")
            }
            ZStack {
                Triangle()
                    .fill(colorFill)
                    .frame(width: 250, height: 220)
                    .shadow(color: Color(hue: 0.666, saturation: 0.993, brightness: 0.934), radius: 40, x: 0, y: 0)
                    .blur(radius: 0.5)
                Text(text)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 60.0)
                    .frame(width: 130, height: 250)
            }
            .rotation3DEffect(.degrees(degrees), axis: (x:0, y: 1, z: 0))
            .rotation3DEffect(.degrees(motion.y * 12), axis: (x: 0, y: -1, z: 0))
            .rotation3DEffect(.degrees(motion.x * 10), axis: (x: 1, y: 0, z: 0))
            .padding(.leading, motion.y * 45)
            .padding(.top, motion.x * 45)
            .onChange(of: motion.didShake) { shake in
                if shake {
                    text = randomAnswer()
                    withAnimation {
                        self.degrees += 360
                        vibrationSuccess()
                    }
                }
            }
            .onChange(of: motion.x) { _ in
                colorFill = LinearGradient(gradient: Gradient(colors: [
                    Color(hue: 0.68, saturation: 0.819, brightness: 0.658 + (motion.x + motion.y) / 4),
                    Color(hue: 0.68, saturation: 0.5, brightness: 0.658 + (motion.x + motion.y) / 4)
                ]), startPoint: .bottom, endPoint: .top)
            }
        }
    }
    
    struct MagicTriangle_Previews: PreviewProvider {
        static var previews: some View {
            MagicTriangle(motion: MotionManager())
        }
    }
}
