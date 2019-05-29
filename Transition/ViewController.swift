//
//  ViewController.swift
//  Transition
//
//  Created by WeAreMobileFirst on 21/05/2019.
//  Copyright © 2019 WeAreMobileFirst. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let presentAnimationController: AnimationController = AnimationController()

    @IBOutlet private weak var imageView: UIImageView!
    @IBAction func onTapButton(_ sender: Any) {
        presentAnimationController.selectedCardFrame = imageView.frame
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        destinationViewController.transitioningDelegate = self
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimationController
    }
}


