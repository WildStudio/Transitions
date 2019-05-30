//
//  ShadowView.swift
//  Transition
//
//  Created by WeAreMobileFirst on 30/05/2019.
//  Copyright © 2019 WeAreMobileFirst. All rights reserved.
//

import UIKit
import CoreMotion

public class ShadowView: UIView {
    /// Core Motion Manager
    private let motionManager = CMMotionManager()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Roll/Pitch Dynamic Shadow
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.02
            motionManager.startDeviceMotionUpdates(to: .main, withHandler: { (motion, error) in
                if let motion = motion {
                    let pitch = motion.attitude.pitch * 10
                    let roll = motion.attitude.roll * 10
                    self.applyShadow(width: CGFloat(roll), height: CGFloat(pitch))
                }
            })
        }
    }
    
    private func applyShadow(width: CGFloat, height: CGFloat) {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 14.0)
        layer.masksToBounds = false
        layer.shadowRadius = 8.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowOpacity = 0.35
        layer.shadowPath = shadowPath.cgPath
    }
}


