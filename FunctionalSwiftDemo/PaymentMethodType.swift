//
//  PaymentMethodType.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation
import UIKit

/// Ways to make a payment. Not payment information, just type.
///
/// - CreditCard: Credit card type
/// - BankAccount: Bank account
public enum PaymentMethodType {
    case CreditCard(CreditCardType)
    case BankAccount()
}

/// Get the image for a method of payment
///
/// - Parameter paymentMethodType: Method of payment type
/// - Returns: Description of the payment method type
public func prettyPrintName(paymentMethodType: PaymentMethodType) -> String {

    switch paymentMethodType {
    case .CreditCard(let cardType):
        return cardType.name
    case .BankAccount():
        return "Bank Account"
    }
}

/// Get an image or an error for a method of payment
///
/// - Parameter paymentMethodType: Method of payment type
/// - Returns: Image or an error
public func paymentImage(paymentMethodType: PaymentMethodType) -> Result<UIImage> {

    switch paymentMethodType {
    case .CreditCard(let cardType):
        return .Success(cardType.icon)
    case .BankAccount():
        return Result<UIImage>.Failure(NSError(domain: "No icon for bank account payments", code: 42))
    }
}

/// Serves as a view model for payment types
public typealias PaymentTypeDisplayInformation = (description: String, imageResult: Result<UIImage>)

extension PaymentMethodType {

    /// Pretty print name of the payment type
    public var name: String {
        return prettyPrintName(paymentMethodType: self)
    }

    /// Icon image for the payment type
    public var icon: Result<UIImage> {
        return paymentImage(paymentMethodType: self)
    }

    /// Payment type name and image
    public var displayInformation: PaymentTypeDisplayInformation {
        return PaymentTypeDisplayInformation(name, icon)
    }
}
