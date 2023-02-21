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
    @Published var didShake = false
    
    
    func stopDeviceMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
    
    func startDeviceMotionUpdates() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.pitch
            self?.y = motion.roll
            self?.z = motion.yaw
            
            if let acceleration = data?.userAcceleration {
                let accelerationThreshold: Double = 2
                
                if abs(acceleration.x) > accelerationThreshold
                    || abs(acceleration.y) > accelerationThreshold
                    || abs(acceleration.z) > accelerationThreshold {
                    
                    self?.didShake = true
                }
                else {
                    self?.didShake = false
                }
            }
        }
    }
}
