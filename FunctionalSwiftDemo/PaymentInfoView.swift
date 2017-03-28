//
//  PaymentInfoView.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation
import UIKit

/// View that shows content about a payment method
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

    /// Show the info about the given payment method within the subviews of this view
    ///
    /// - Parameter paymentDisplayData: Payment view data serving as a model
    public func showPaymentInformation(paymentDisplayData: CreditCardDisplayInformation) {

        paymentMethodDescriptionLabel.text = paymentDisplayData.description
        paymentMethodImageView.image = paymentDisplayData.image
    }

    /// Show the info about payment types beyond just credit cards
    ///
    /// - Parameter paymentMethodData: Type of payment
    public func showPaymentMethodType(paymentMethodData: PaymentTypeDisplayInformation) {

        paymentMethodDescriptionLabel.text = paymentMethodData.description
        paymentMethodImageView.image = {
            switch (paymentMethodData.imageResult) {
            case .Success(let image):
                return image
            case .Failure(let error):
                print("Image Fetch Error: \(error.domain)")
                return nil
            }

        }()
    }
}
