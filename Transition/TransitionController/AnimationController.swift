//  Copyright © 2019 Discovery Communications. All rights reserved.

import UIKit

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private enum Constant {
        static let duration: TimeInterval = 0.5
        static let backgroundColor = UIColor.gray.withAlphaComponent(0.9)
    }
    
    var selectedCardFrame: CGRect = .zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constant.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext
            .viewController(forKey: .to) as? DetailViewController else { return }
        
        let container = transitionContext.containerView
        container.addSubview(toViewController.view)
        
        toViewController.positionContainer(left: 20.0,
                                           right: 20.0,
                                           top: selectedCardFrame.origin.y + 20.0,
                                           bottom: 0.0)
        toViewController.view.backgroundColor = .clear
        toViewController.setRoundedCorners(isRounded: false)
        
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toViewController.positionContainer(left: 20.0,
                                               right: 20.0,
                                               top: 20.0,
                                               bottom: 0.0)
            toViewController.view.backgroundColor = Constant.backgroundColor
            toViewController.setRoundedCorners(isRounded: true)
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
