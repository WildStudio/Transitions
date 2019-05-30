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
        let animator = UIViewPropertyAnimator(duration: Constant.duration, dampingRatio: 0.82)
        
        let container = transitionContext.containerView
        container.addSubview(toViewController.view)
        let offscreenY = toViewController.view.bounds.height - toViewController.view.frame.minY + 20
        toViewController.positionContainer(left: 20.0,
                                           right: 20.0,
                                           top: offscreenY,
                                           bottom: 0.0)
        toViewController.view.backgroundColor = .clear
        toViewController.setRoundedCorners(isRounded: true)

        
        animator.addAnimations {
            toViewController.positionContainer(left: 20.0,
                                               right: 20.0,
                                               top: 40.0,
                                               bottom: 0.0)
            toViewController.view.backgroundColor = Constant.backgroundColor
            toViewController.setRoundedCorners(isRounded: true)
            toViewController.addSpringAnimation(true)
           
        }
      
        animator.addCompletion { _ in
            toViewController.addSpringAnimation(false)
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
    
    
}
