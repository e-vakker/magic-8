//
//  MotionManager.swift
//  Magic 8 iPhone
//
//  Created by Jevgeni Vakker on 03.09.2022.
//

import Foundation
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var x = 0.0
    @Published var y = 0.0
    @Published var z = 0.0
    
    init () {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
            self?.z = motion.yaw
        }
    }
    
}
