//
//  PaymentType.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation
import UIKit

/// Types of credit cards supported by this application
///
/// - Discover: Discover card
/// - Amex: American Express
/// - Mastercard: Mastercard
/// - Visa: Visa
enum CreditCardType {
    case Discover
    case Amex
    case Mastercard
    case Visa
}

class OOP_PaymentMethod {

    /// Type of card used for payment
    let creditCardType: CreditCardType

    init(_ creditCardType: CreditCardType) {
        self.creditCardType = creditCardType
    }

    /// Get the credit card description and image
    ///
    /// - Returns: Description/Image tuple
    public func getCardInformation() -> (String, UIImage?) {

        var cardDescription = ""
        var cardImageName = ""

        switch creditCardType {
        case .Discover:
            cardDescription = "Discover"
            cardImageName = "cc_discover"
        case .Amex:
            cardDescription = "Amex"
            cardImageName = "cc_amex"
        case .Mastercard:
            cardDescription = "Mastercard"
            cardImageName = "cc_mastercard"
        case .Visa:
            cardDescription = "Visa"
            cardImageName = "cc_visa"
        }

        return (cardDescription, UIImage(named: cardImageName))
    }
}
