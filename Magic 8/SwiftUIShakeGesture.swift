

// Import From https://github.com/globulus/swiftui-shake-gesture

import SwiftUI

public extension Notification.Name {
    static let shakeEnded = Notification.Name("ShakeEnded")
}

public extension UIWindow {
     override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: .shakeEnded, object: nil)
        }
        super.motionBegan(motion, with: event)
     }
}

struct ShakeDetector: ViewModifier {
    let onShake: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear() // this has to be here because of a SwiftUI bug
            .onReceive(NotificationCenter.default.publisher(for: .shakeEnded)) { _ in
                onShake()
            }
    }
}

public extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeDetector(onShake: action))
    }
}
