//
//  GradientView.swift
//  Transition
//
//  Created by WeAreMobileFirst on 30/05/2019.
//  Copyright © 2019 WeAreMobileFirst. All rights reserved.
//

import UIKit

public class GradientView: UIView {
    
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public var gradientLayer: CAGradientLayer? {
        return layer as? CAGradientLayer
    }
    
    @IBInspectable
    public var startPoint: CGPoint {
        get {
            return gradientLayer?.startPoint ?? .zero
        }
        set {
            gradientLayer?.startPoint = newValue
        }
    }
    
    @IBInspectable
    public var endPoint: CGPoint {
        get {
            return gradientLayer?.endPoint ?? .zero
        }
        set {
            gradientLayer?.endPoint = newValue
        }
    }
    
    @IBInspectable public var startColor: UIColor?
    @IBInspectable public var endColor: UIColor?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setGradient([(startColor, 0.0), (endColor, 1.0)])
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setGradient([(startColor, 0.0), (endColor, 1.0)])
    }
    
    public func setGradient(_ points: [(color: UIColor?, location: Float)]) {
        self.backgroundColor = .clear
        
        self.gradientLayer?.colors = points.map { point in
            point.color?.cgColor ?? UIColor.clear.cgColor
        }
        
        self.gradientLayer?.locations = points.map { point in
            NSNumber(value: point.location)
        }
    }
}

