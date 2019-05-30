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
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func positionContainer(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
        containerLeadingConstraint.constant = left
        containerTrailingConstraint.constant = right
        containerTopConstraint.constant = top
        containerBottomConstraint.constant = bottom
        view.layoutIfNeeded()
    }
    
    func setRoundedCorners(isRounded: Bool) {
        contentContainerView.layer.cornerRadius = isRounded ? 14.0 : 0.0
    }
    
    @IBAction func onClose() {
        self.dismiss(animated: true)
    }
}
