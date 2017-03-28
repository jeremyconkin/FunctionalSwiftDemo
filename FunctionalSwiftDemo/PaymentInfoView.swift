//
//  PaymentInfoView.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation
import UIKit

class PaymentInfoView: UIView {

    // Shows a credit card image
    @IBOutlet weak var paymentMethodDescriptionLabel: UILabel!

    // Show a credit card description
    @IBOutlet weak var paymentMethodImageView: UIImageView!

    /// Show the info about the given payment method within the subviews of this view
    ///
    /// - Parameter paymentMethod: Payment method serving as a model
    public func showPaymentInformation(paymentMethod: OOP_PaymentMethod) {

        let paymentInformation = paymentMethod.getCardInformation()
        paymentMethodDescriptionLabel.text = paymentInformation.0
        paymentMethodImageView.image = paymentInformation.1
    }
}
