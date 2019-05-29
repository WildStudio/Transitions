//
//  DetailViewController.swift
//  Transition
//
//  Created by WeAreMobileFirst on 21/05/2019.
//  Copyright © 2019 WeAreMobileFirst. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    /// Container
    @IBOutlet private weak var contentContainerView: UIView!
    @IBOutlet private weak var containerLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerBottomConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    func positionContainer(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
        containerLeadingConstraint.constant = left
        containerTrailingConstraint.constant = right
        containerTopConstraint.constant = top
        containerBottomConstraint.constant = bottom
        view.layoutIfNeeded()
    }
    
    func setRoundedCorners(isRounded: Bool) {
        view.layer.cornerRadius = isRounded ? 14.0 : 0.0
    }
    
    @IBAction func onClose() {
        self.dismiss(animated: true)
    }
}

